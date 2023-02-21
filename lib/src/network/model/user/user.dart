import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/role/role.dart';
import 'personal_information.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(copyWith: true)
class User with _$User {
  const factory User({
    required int id,
    @JsonKey(name: 'status_verify') required String status,
    required String name,
    String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    required List<Role>? roles,
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
    @JsonKey(name: 'is_password_null') bool? isPasswordNull,
    @JsonKey(name: 'personal_information')
        PersonalInformation? personalInformation,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "salary") int? salary,
    @JsonKey(name: "jabatan") String? jabatan,
    @JsonKey(name: "principal") String? principal,
    @JsonKey(name: "no_karyawan") String? no_karyawan,
    @JsonKey(name: "ktp") String? ktp,
    @JsonKey(name: "nama_bank") String? nama_bank,
    @JsonKey(name: "rekening") String? rekening,
    @JsonKey(name: "bpjs") String? bpjs,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);
}
