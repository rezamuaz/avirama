part of 'attendance_bloc.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState.initial() = _Initial;
  const factory AttendanceState.isLoading() = _IsLoading;
  const factory AttendanceState.isLoadingCheckIn() = _IsLoadingCheckIn;
  const factory AttendanceState.isError(NetworkExceptions networkExceptions) =
      _IsError;
  const factory AttendanceState.attendanceinResult(AttendanceInResult result) =
      _AttendanceinResult;
  const factory AttendanceState.loadedStoreDetail(
      AttendanceStoreDetail result) = _LoadedStoreDetail;
  const factory AttendanceState.isLoadingGetStoreDetail() =
      _IsLoadingGetStoreDetail;
  const factory AttendanceState.loadedActiveAttendance(Attendance attendance) =
      _LoadedActiveAttendance;
  const factory AttendanceState.isLoadingActiveAttendance() =
      _IsLoadingActiveAttendance;
  const factory AttendanceState.isDataNull() = _IsDataNull;
  const factory AttendanceState.loadedActivity(List<Activity>? listActivity) =
      _LoadedActivity;
  const factory AttendanceState.loadedDailyPhoto(List<Activity>? listActivity) =
      _LoadedDailyPhoto;
  const factory AttendanceState.loadedBeforeAfterPhoto(
      List<Activity>? listActivity) = _LoadedBeforeAfterPhoto;
  const factory AttendanceState.beforeAfterCount(int count) = _BeforeAfterCount;
  const factory AttendanceState.dailyCount(int count) = _DailyCount;
  const factory AttendanceState.isAttendanceAllowed(bool state) =
      _IsAttendanceAllowed;

  const factory AttendanceState.loadedAttendances(ListAttendance? attendance) =
      _LoadedAttendances;
}
