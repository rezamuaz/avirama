import 'package:absensi_app/src/network/model/outlet/outlet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class ListAttendance with _$ListAttendance {
  const factory ListAttendance({
    @JsonKey(name: "currentPage") int? currentPage,
    @JsonKey(name: "totalPage") int? totalPage,
    @JsonKey(name: "nextPage") int? nextPage,
    List<Attendance>? data,
  }) = _ListAttendance;
  const ListAttendance._();
  factory ListAttendance.fromJson(Map<String, dynamic> map) =>
      _$ListAttendanceFromJson(map);
}

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required int id,
    required String date,
    required String outlet,
    @JsonKey(name: "check_int") String? checkInt,
    @JsonKey(name: "check_out") String? checkOut,
    @JsonKey(name: "long_int") String? longInt,
    @JsonKey(name: "long_out") String? longOut,
    @JsonKey(name: "lang_int") String? langInt,
    @JsonKey(name: "lang_out") String? langOut,
    String? note,
    @JsonKey(name: "data_outlet") required Outlet dataOutlet,
  }) = _Attendance;
  const Attendance._();
  factory Attendance.fromJson(Map<String, dynamic> map) =>
      _$AttendanceFromJson(map);
}

@freezed
class AttendanceInResult with _$AttendanceInResult {
  const factory AttendanceInResult({
    required bool status,
    required String message,
  }) = _AttendanceInResult;
  const AttendanceInResult._();
  factory AttendanceInResult.fromJson(Map<String, dynamic> map) =>
      _$AttendanceInResultFromJson(map);
}

@freezed
class AttendanceStoreDetail with _$AttendanceStoreDetail {
  const factory AttendanceStoreDetail({
    required String name,
    required String id,
    required String address,
    String? long,
    String? lang,
    String? image,
  }) = _AttendanceStoreDetail;
  const AttendanceStoreDetail._();
  factory AttendanceStoreDetail.fromJson(Map<String, dynamic> map) =>
      _$AttendanceStoreDetailFromJson(map);
}
