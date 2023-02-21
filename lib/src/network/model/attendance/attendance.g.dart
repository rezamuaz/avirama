// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListAttendance _$$_ListAttendanceFromJson(Map<String, dynamic> json) =>
    _$_ListAttendance(
      currentPage: json['currentPage'] as int?,
      totalPage: json['totalPage'] as int?,
      nextPage: json['nextPage'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Attendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListAttendanceToJson(_$_ListAttendance instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'nextPage': instance.nextPage,
      'data': instance.data,
    };

_$_Attendance _$$_AttendanceFromJson(Map<String, dynamic> json) =>
    _$_Attendance(
      id: json['id'] as int,
      date: json['date'] as String,
      outlet: json['outlet'] as String,
      checkInt: json['check_int'] as String?,
      checkOut: json['check_out'] as String?,
      longInt: json['long_int'] as String?,
      longOut: json['long_out'] as String?,
      langInt: json['lang_int'] as String?,
      langOut: json['lang_out'] as String?,
      note: json['note'] as String?,
      dataOutlet: Outlet.fromJson(json['data_outlet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AttendanceToJson(_$_Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'outlet': instance.outlet,
      'check_int': instance.checkInt,
      'check_out': instance.checkOut,
      'long_int': instance.longInt,
      'long_out': instance.longOut,
      'lang_int': instance.langInt,
      'lang_out': instance.langOut,
      'note': instance.note,
      'data_outlet': instance.dataOutlet,
    };

_$_AttendanceInResult _$$_AttendanceInResultFromJson(
        Map<String, dynamic> json) =>
    _$_AttendanceInResult(
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_AttendanceInResultToJson(
        _$_AttendanceInResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

_$_AttendanceStoreDetail _$$_AttendanceStoreDetailFromJson(
        Map<String, dynamic> json) =>
    _$_AttendanceStoreDetail(
      name: json['name'] as String,
      id: json['id'] as String,
      address: json['address'] as String,
      long: json['long'] as String?,
      lang: json['lang'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_AttendanceStoreDetailToJson(
        _$_AttendanceStoreDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'address': instance.address,
      'long': instance.long,
      'lang': instance.lang,
      'image': instance.image,
    };
