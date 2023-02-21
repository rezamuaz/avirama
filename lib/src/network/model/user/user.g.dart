// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      status: json['status_verify'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      profilePhotoUrl: json['profile_photo_url'] as String?,
      isPasswordNull: json['is_password_null'] as bool?,
      personalInformation: json['personal_information'] == null
          ? null
          : PersonalInformation.fromJson(
              json['personal_information'] as Map<String, dynamic>),
      type: json['type'] as String?,
      salary: json['salary'] as int?,
      jabatan: json['jabatan'] as String?,
      principal: json['principal'] as String?,
      no_karyawan: json['no_karyawan'] as String?,
      ktp: json['ktp'] as String?,
      nama_bank: json['nama_bank'] as String?,
      rekening: json['rekening'] as String?,
      bpjs: json['bpjs'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'status_verify': instance.status,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'roles': instance.roles,
      'profile_photo_url': instance.profilePhotoUrl,
      'is_password_null': instance.isPasswordNull,
      'personal_information': instance.personalInformation,
      'type': instance.type,
      'salary': instance.salary,
      'jabatan': instance.jabatan,
      'principal': instance.principal,
      'no_karyawan': instance.no_karyawan,
      'ktp': instance.ktp,
      'nama_bank': instance.nama_bank,
      'rekening': instance.rekening,
      'bpjs': instance.bpjs,
    };
