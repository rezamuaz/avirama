import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_detail.freezed.dart';
part 'profile_detail.g.dart';

@freezed
class ProfileDetail with _$ProfileDetail {
  factory ProfileDetail(
      {required int? id,
      required String? name,
      required String? foto,
      required String? salary,
      required int? percent,
      @JsonKey(name: "total_attendance_mountly")
          required int? totalAttendanceMountly}) = _ProfileDetail;

  factory ProfileDetail.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailFromJson(json);
}
