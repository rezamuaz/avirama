// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
    };
