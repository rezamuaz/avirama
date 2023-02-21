// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserReport _$UserReportFromJson(Map<String, dynamic> json) {
  return _UserReport.fromJson(json);
}

/// @nodoc
mixin _$UserReport {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_photo_path")
  String? get profilePhotoPath => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get jabatan => throw _privateConstructorUsedError;
  String? get principal => throw _privateConstructorUsedError;
  @JsonKey(name: "no_karyawan")
  String? get noKaryawan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_UserReport implements _UserReport {
  _$_UserReport(
      {this.id,
      this.name,
      this.email,
      @JsonKey(name: "profile_photo_path") this.profilePhotoPath,
      @JsonKey(name: "phone_number") this.phoneNumber,
      this.type,
      this.role,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      this.jabatan,
      this.principal,
      @JsonKey(name: "no_karyawan") this.noKaryawan});

  factory _$_UserReport.fromJson(Map<String, dynamic> json) =>
      _$$_UserReportFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  @JsonKey(name: "profile_photo_path")
  final String? profilePhotoPath;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  final String? type;
  @override
  final String? role;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  final String? jabatan;
  @override
  final String? principal;
  @override
  @JsonKey(name: "no_karyawan")
  final String? noKaryawan;

  @override
  String toString() {
    return 'UserReport(id: $id, name: $name, email: $email, profilePhotoPath: $profilePhotoPath, phoneNumber: $phoneNumber, type: $type, role: $role, createdAt: $createdAt, updatedAt: $updatedAt, jabatan: $jabatan, principal: $principal, noKaryawan: $noKaryawan)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserReportToJson(
      this,
    );
  }
}

abstract class _UserReport implements UserReport {
  factory _UserReport(
      {final int? id,
      final String? name,
      final String? email,
      @JsonKey(name: "profile_photo_path") final String? profilePhotoPath,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      final String? type,
      final String? role,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      final String? jabatan,
      final String? principal,
      @JsonKey(name: "no_karyawan") final String? noKaryawan}) = _$_UserReport;

  factory _UserReport.fromJson(Map<String, dynamic> json) =
      _$_UserReport.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  @JsonKey(name: "profile_photo_path")
  String? get profilePhotoPath;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  String? get type;
  @override
  String? get role;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  String? get jabatan;
  @override
  String? get principal;
  @override
  @JsonKey(name: "no_karyawan")
  String? get noKaryawan;
}
