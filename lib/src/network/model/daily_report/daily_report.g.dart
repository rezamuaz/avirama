// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyReport _$$_DailyReportFromJson(Map<String, dynamic> json) =>
    _$_DailyReport(
      id: json['id'] as int,
      name: json['name'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      note: json['description'] as String,
      long: json['long'] as String,
      lang: json['lang'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$_DailyReportToJson(_$_DailyReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'time': instance.time,
      'location': instance.location,
      'description': instance.note,
      'long': instance.long,
      'lang': instance.lang,
      'created_at': instance.createdAt,
    };

_$_DailyReportRequest _$$_DailyReportRequestFromJson(
        Map<String, dynamic> json) =>
    _$_DailyReportRequest(
      name: json['name'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      note: json['description'] as String,
      long: json['long'] as String,
      lang: json['lang'] as String,
    );

Map<String, dynamic> _$$_DailyReportRequestToJson(
        _$_DailyReportRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'time': instance.time,
      'location': instance.location,
      'description': instance.note,
      'long': instance.long,
      'lang': instance.lang,
    };
