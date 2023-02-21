// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelectOutlet _$$_SelectOutletFromJson(Map<String, dynamic> json) =>
    _$_SelectOutlet(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      long: json['long'] as String?,
      lang: json['lang'] as String?,
      radius: json['radius'] as String,
      is_complete: json['is_complete'] as bool?,
    );

Map<String, dynamic> _$$_SelectOutletToJson(_$_SelectOutlet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'long': instance.long,
      'lang': instance.lang,
      'radius': instance.radius,
      'is_complete': instance.is_complete,
    };

_$_Outlet _$$_OutletFromJson(Map<String, dynamic> json) => _$_Outlet(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      long: json['long'] as String?,
      lang: json['lang'] as String?,
      image: json['image'] as String?,
      radius: json['radius'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      targetBulanan: json['target_bulanan'] as String?,
    );

Map<String, dynamic> _$$_OutletToJson(_$_Outlet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'long': instance.long,
      'lang': instance.lang,
      'image': instance.image,
      'radius': instance.radius,
      'status': instance.status,
      'created_at': instance.createdAt,
      'target_bulanan': instance.targetBulanan,
    };

_$_OutletRequest _$$_OutletRequestFromJson(Map<String, dynamic> json) =>
    _$_OutletRequest(
      name: json['name'] as String,
      long: json['long'] as String?,
      lang: json['lang'] as String?,
      radius: json['radius'] as String,
      address: json['address'] as String?,
      targetBulanan: json['target_bulanan'] as String?,
    );

Map<String, dynamic> _$$_OutletRequestToJson(_$_OutletRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'long': instance.long,
      'lang': instance.lang,
      'radius': instance.radius,
      'address': instance.address,
      'target_bulanan': instance.targetBulanan,
    };
