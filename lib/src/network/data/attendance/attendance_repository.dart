import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/attendance/attendance.dart';

abstract class AttendanceRepository {
  Future<ApiResult<AttendanceInResult>> attendanceInRequest({
    required String storeId,
    required String imagePath,
    required String lang,
    required String long,
  });
  Future<ApiResult<AttendanceInResult>> attendanceOutRequest({
    required String storeId,
    required String imagePath,
    required String lang,
    required String long,
    required String note,
  });
  Future<ApiResult<AttendanceStoreDetail>> storeDetail({
    required String id,
  });
  Future<ApiResult<ListAttendance?>> attendanceList(
      {int page, String startDate, String endDate});
}
