import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/data/common/http.dart';
import 'package:absensi_app/src/network/data/profile/profile_repository.dart';
import 'package:absensi_app/src/network/model/profile/profile_detail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  late XHttp http;

  ProfileRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<ProfileDetail>> profileDetail() async {
    return await http.get(
      "/profile/me",
      onSuccess: (response) => ProfileDetail.fromJson(
        response.data['data'],
      ),
      authorization: true,
    );
  }
}
