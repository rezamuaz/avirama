import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_report.freezed.dart';
part 'user_report.g.dart';

@freezed
class UserReport with _$UserReport {
  factory UserReport({
    int? id,
    String? name,
    String? email,
    @JsonKey(name: "profile_photo_path") String? profilePhotoPath,
    @JsonKey(name: "phone_number") String? phoneNumber,
    String? type,
    String? role,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    String? jabatan,
    String? principal,
    @JsonKey(name: "no_karyawan") String? noKaryawan,
  }) = _UserReport;

  factory UserReport.fromJson(Map<String, dynamic> json) =>
      _$UserReportFromJson(json);
}
