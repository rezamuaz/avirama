// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserReport _$$_UserReportFromJson(Map<String, dynamic> json) =>
    _$_UserReport(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePhotoPath: json['profile_photo_path'] as String?,
      phoneNumber: json['phone_number'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      jabatan: json['jabatan'] as String?,
      principal: json['principal'] as String?,
      noKaryawan: json['no_karyawan'] as String?,
    );

Map<String, dynamic> _$$_UserReportToJson(_$_UserReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profile_photo_path': instance.profilePhotoPath,
      'phone_number': instance.phoneNumber,
      'type': instance.type,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'jabatan': instance.jabatan,
      'principal': instance.principal,
      'no_karyawan': instance.noKaryawan,
    };
