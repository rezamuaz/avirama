import 'package:absensi_app/src/core/api/api_result.dart';

abstract class NotificationRepository {
  Future<ApiResult<String>> updateDeviceToken({
    required String token,
  });
}
