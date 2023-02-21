import 'dart:developer';
import 'dart:io';

import 'package:logger/logger.dart';

import 'error_response_message.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@Freezed(
  map: FreezedMapOptions(map: true),
)
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest({String? reason}) =
      UnauthorisedRequest;

  const factory NetworkExceptions.badRequest({String? reason}) = BadRequest;

  const factory NetworkExceptions.notFound({String? reason}) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.unprocessableEntity(
    ErrorResponseMessage? reasons,
  ) = UnprocessableEntity;

  // ignore: prefer_constructors_over_static_methods
  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        late NetworkExceptions networkExceptions;
        if (error is DioError) {
          networkExceptions = whenDioError(error);
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return const NetworkExceptions.formatException();
      } catch (asd) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        log('#=====================');
        log('E: $error');
        log('=====================#');
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static NetworkExceptions whenDioError(DioError error) {
    late NetworkExceptions networkExceptions;
    switch (error.type) {
      case DioErrorType.other:
        networkExceptions = const NetworkExceptions.noInternetConnection();
        break;
      case DioErrorType.cancel:
        networkExceptions = const NetworkExceptions.requestCancelled();
        break;
      case DioErrorType.connectTimeout:
        networkExceptions = const NetworkExceptions.requestTimeout();
        break;
      case DioErrorType.receiveTimeout:
        networkExceptions = const NetworkExceptions.sendTimeout();
        break;
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case 400:
            networkExceptions = NetworkExceptions.badRequest(
              reason: error.response?.data['message'],
            );
            break;
          case 401:
            networkExceptions = NetworkExceptions.unauthorisedRequest(
              reason: error.response?.data['message'],
            );
            break;
          case 403:
            networkExceptions = NetworkExceptions.unauthorisedRequest(
              reason: error.response?.data['message'],
            );
            break;
          case 404:
            networkExceptions = NetworkExceptions.notFound(
              reason: error.response?.data['message'],
            );
            break;
          case 409:
            networkExceptions = const NetworkExceptions.conflict();
            break;
          case 408:
            networkExceptions = const NetworkExceptions.requestTimeout();
            break;
          case 500:
            networkExceptions = const NetworkExceptions.internalServerError();
            break;
          case 503:
            networkExceptions = const NetworkExceptions.serviceUnavailable();
            break;
          case 422:
            networkExceptions = NetworkExceptions.unprocessableEntity(
              ErrorResponseMessage.fromJson(error.response?.data),
            );
            break;
          default:
            final int? responseCode = error.response?.statusCode;
            networkExceptions = NetworkExceptions.defaultError(
              "Received invalid status code: $responseCode",
            );
        }
        break;
      case DioErrorType.sendTimeout:
        networkExceptions = const NetworkExceptions.sendTimeout();
        break;
    }

    return networkExceptions;
  }
}
