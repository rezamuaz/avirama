import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/profile/profile_detail.dart';

abstract class ProfileRepository {
  Future<ApiResult<ProfileDetail>> profileDetail();
}
