// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutletReport _$$_OutletReportFromJson(Map<String, dynamic> json) =>
    _$_OutletReport(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      long: json['long'] as String?,
      lang: json['lang'] as String?,
      image: json['image'] as String?,
      radius: json['radius'] as String?,
      status: json['status'] as String?,
      targetBulanan: json['target_bulanan'] as String?,
      isComplete: json['is_complete'] as bool?,
    );

Map<String, dynamic> _$$_OutletReportToJson(_$_OutletReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'long': instance.long,
      'lang': instance.lang,
      'image': instance.image,
      'radius': instance.radius,
      'status': instance.status,
      'target_bulanan': instance.targetBulanan,
      'is_complete': instance.isComplete,
    };
