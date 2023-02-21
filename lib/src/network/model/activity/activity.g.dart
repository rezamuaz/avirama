// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListActivity _$$_ListActivityFromJson(Map<String, dynamic> json) =>
    _$_ListActivity(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListActivityToJson(_$_ListActivity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_Activity _$$_ActivityFromJson(Map<String, dynamic> json) => _$_Activity(
      id: json['id'] as int,
      photo: json['photo'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'description': instance.description,
    };

_$_ActivityResult _$$_ActivityResultFromJson(Map<String, dynamic> json) =>
    _$_ActivityResult(
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_ActivityResultToJson(_$_ActivityResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
