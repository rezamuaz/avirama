import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/report/outlet_report.dart';
import 'package:absensi_app/src/network/model/report/user_report.dart';

abstract class ReportRepository {
  Future<ApiResult<List<OutletReport>>> outletList();
  Future<ApiResult<List<UserReport>>> userReportList(String jabatan);
  Future<ApiResult<String>> sendReport(Map<String, dynamic> params);
}
