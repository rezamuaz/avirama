// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileDetail _$$_ProfileDetailFromJson(Map<String, dynamic> json) =>
    _$_ProfileDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      foto: json['foto'] as String?,
      salary: json['salary'] as String?,
      percent: json['percent'] as int?,
      totalAttendanceMountly: json['total_attendance_mountly'] as int?,
    );

Map<String, dynamic> _$$_ProfileDetailToJson(_$_ProfileDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'foto': instance.foto,
      'salary': instance.salary,
      'percent': instance.percent,
      'total_attendance_mountly': instance.totalAttendanceMountly,
    };
