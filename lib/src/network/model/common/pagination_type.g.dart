// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationType<T> _$$_PaginationTypeFromJson<T>(Map<String, dynamic> json) =>
    _$_PaginationType<T>(
      data: (json['data'] as List<dynamic>?)
          ?.map(_Converter<T>().fromJson)
          .toList(),
      links: json['links'] == null
          ? null
          : Link.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PaginationTypeToJson<T>(
        _$_PaginationType<T> instance) =>
    <String, dynamic>{
      'data': instance.data?.map(_Converter<T>().toJson).toList(),
      'links': instance.links,
      'meta': instance.meta,
    };
