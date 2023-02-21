import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/data/common/http.dart';
import 'package:absensi_app/src/network/data/report/report_repository.dart';
import 'package:absensi_app/src/network/model/report/outlet_report.dart';
import 'package:absensi_app/src/network/model/report/user_report.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReportRepositoryImpl implements ReportRepository {
  late XHttp http;

  ReportRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<List<OutletReport>>> outletList() async {
    return await http.get(
      "/store/list",
      onSuccess: (response) => (response.data['data'] as List)
          .map((e) => OutletReport.fromJson(e))
          .toList(),
      authorization: true,
    );
  }

  @override
  Future<ApiResult<List<UserReport>>> userReportList(String jabatan) async {
    Map<String, dynamic> params = {"jabatan": jabatan};
    return await http.post(
      "/report/pengguna",
      data: params,
      onSuccess: (response) => (response.data['data'] as List)
          .map((e) => UserReport.fromJson(e))
          .toList(),
    );
  }

  @override
  Future<ApiResult<String>> sendReport(Map<String, dynamic> params) async {
    return await http.post(
      "/report",
      data: params,
      onSuccess: (response) => response.data["message"],
    );
  }
}
