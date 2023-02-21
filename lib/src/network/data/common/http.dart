import 'dart:developer';

import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import '../../../localization/localization_utils.dart';
import '../../../services/auth_service.dart';
import '../../../services/user_prefs.dart';

const int _defaultConnectTimeout = Duration.millisecondsPerMinute;
const int _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class XHttp {
  late final String baseUrl;

  late Dio _dio;
  late final List<Interceptor>? interceptors;

  XHttp({String? xBaseUrl, Interceptors? this.interceptors}) {
    // get api base url from .env file
    baseUrl = xBaseUrl ?? dotenv.env['API_BASE_URL'] ?? '';
    // set options
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _defaultConnectTimeout,
      receiveTimeout: _defaultReceiveTimeout,
    ));

    // set request header
    _dio.options.headers['Accept'] = 'application/json';

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
  }

  Future<ApiResult<T>> get<T>(
    String endPoint, {
    bool authorization = false,
    dynamic Function(Response<dynamic>)? onSuccess,
  }) async {
    return sendRequest(
      () => _dio.get(endPoint),
      authorization: authorization,
      onSuccess: onSuccess,
    );
  }

  Future<ApiResult<T>> post<T>(
    String endPoint, {
    dynamic data,
    dynamic Function(Response<dynamic>)? onSuccess,
  }) async {
    return await sendRequest<T>(
      () async => _dio.post(
        endPoint,
        data: data,
      ),
      authorization: true,
      onSuccess: onSuccess,
    );
  }

  Future<ApiResult<T>> patch<T>(
    String endPoint, {
    dynamic data,
    dynamic Function(Response<dynamic>)? onSuccess,
  }) async {
    return await sendRequest<T>(
      () async => _dio.patch(
        endPoint,
        data: data,
      ),
      authorization: true,
      onSuccess: onSuccess,
    );
  }

  Future<ApiResult<T>> put<T>(
    String endPoint, {
    dynamic data,
    dynamic Function(Response<dynamic>)? onSuccess,
  }) async {
    return await sendRequest<T>(
      () async => _dio.put(
        endPoint,
        data: data,
      ),
      authorization: true,
      onSuccess: onSuccess,
    );
  }

  Future<ApiResult<T>> delete<T>(
    String endPoint, {
    dynamic Function(Response<dynamic>)? onSuccess,
  }) async {
    return await sendRequest<T>(
      () async => _dio.delete(
        endPoint,
      ),
      authorization: true,
      onSuccess: onSuccess,
    );
  }

  Future<ApiResult<T>> sendRequest<T>(
    Future<Response<dynamic>> Function() httpRequest, {
    bool authorization = false,
    dynamic Function(Response<dynamic>)? onSuccess,
  }) async {
    if (authorization) setAuthorization();
    _setAcceptLanguage();

    try {
      Response<dynamic> response = await httpRequest();
      return ApiResult.success(
        data: onSuccess?.call(response) ?? S.text.common_success,
      );
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  void setAuthorization() {
    Auth auth = Auth.instance;
    if (auth.isLoggedIn) {
      log('#=====================auth');
      log('Login as token: Bearer ${auth.token}');
      log('=====================#');
      _dio.options.headers['Authorization'] = 'Bearer ${auth.token}';
    }
  }

  void _setAcceptLanguage() {
    _dio.options.headers['Accept-Language'] =
        UserPrefs().getLocale()?.languageCode;
  }
}
