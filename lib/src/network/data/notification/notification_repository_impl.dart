import 'dart:async';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../common/http.dart';
import 'notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  late XHttp http;

  NotificationRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<String>> updateDeviceToken({required String token}) async {
    return await http.post(
      '/firebase/device-token',
      data: {
        'device_token': token,
      },
    );
  }
}
