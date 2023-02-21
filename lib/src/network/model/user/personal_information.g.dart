// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonalInformation _$$_PersonalInformationFromJson(
        Map<String, dynamic> json) =>
    _$_PersonalInformation(
      gender: json['gender'] as String?,
      phoneNumber: json['phone_number'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
    );

Map<String, dynamic> _$$_PersonalInformationToJson(
        _$_PersonalInformation instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'phone_number': instance.phoneNumber,
      'place_of_birth': instance.placeOfBirth,
      'date_of_birth': instance.dateOfBirth,
    };
