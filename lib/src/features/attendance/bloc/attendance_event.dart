part of 'attendance_bloc.dart';

@freezed
class AttendanceEvent with _$AttendanceEvent {
  const factory AttendanceEvent.started() = _Started;
  const factory AttendanceEvent.show(int id) = _Show;
  const factory AttendanceEvent.attendanceInRequest(
          String storeId, String imagePath, String lang, String long) =
      _AttendanceInRequest;
  const factory AttendanceEvent.attendanceOutRequest(
      String storeId,
      String imagePath,
      String lang,
      String long,
      String note) = _AttendanceOutRequest;
  const factory AttendanceEvent.getStoreDetail(String id) = _GetStoreDetail;
  const factory AttendanceEvent.activeAttendance() = _ActiveAttendance;
  const factory AttendanceEvent.showActivity(int attendanceId) = _ShowActivity;
  const factory AttendanceEvent.dailyPhotoCountEvent(int attendanceId) =
      _DailyPhotoCountEvent;
  const factory AttendanceEvent.beforeAfterCountEvent(int attendanceId) =
      _BeforeAfterCountEvent;
  const factory AttendanceEvent.showDaily(int attendanceId) = _ShowDaily;
  const factory AttendanceEvent.showBeforeAfter(int attendanceId) =
      _ShowBeforeAfter;

  const factory AttendanceEvent.isAttendanceAllowedEvent(int attendanceId) =
      _IsAttendanceAllowedState;

  const factory AttendanceEvent.addFotoHarian(
    int attendanceId,
    String imagePath,
  ) = _AddFotoHarian;

  const factory AttendanceEvent.addFotoBeforeAfter(
    int attendanceId,
    String imagePath,
    String description,
  ) = _AddFotoBeforeAfter;

  const factory AttendanceEvent.attendanceList(
      {int? page, String? startDate, String? endDate}) = _AttendanceList;
}
