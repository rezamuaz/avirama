// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutletInfo _$$_OutletInfoFromJson(Map<String, dynamic> json) =>
    _$_OutletInfo(
      product: json['produk'] as int? ?? 0,
      competitor: json['kompetitor'] as int? ?? 0,
      promo: json['promo'] as int? ?? 0,
      kunjungan: json['kunjungan'] as int? ?? 0,
      dataOutlet: json['data'] == null
          ? null
          : OutletInfoDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OutletInfoToJson(_$_OutletInfo instance) =>
    <String, dynamic>{
      'produk': instance.product,
      'kompetitor': instance.competitor,
      'promo': instance.promo,
      'kunjungan': instance.kunjungan,
      'data': instance.dataOutlet,
    };

_$_OutletInfoDetail _$$_OutletInfoDetailFromJson(Map<String, dynamic> json) =>
    _$_OutletInfoDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      long: json['long'] as String?,
      lang: json['lang'] as String?,
      image: json['image'] as String?,
      radius: json['radius'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: json['status'] as String?,
      targetBulanan: json['target_bulanan'] as String?,
      idPrincipal: json['id_principal'] as String?,
      kodeOutlet: json['kode_outlet'] as String?,
    );

Map<String, dynamic> _$$_OutletInfoDetailToJson(_$_OutletInfoDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'long': instance.long,
      'lang': instance.lang,
      'image': instance.image,
      'radius': instance.radius,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status': instance.status,
      'target_bulanan': instance.targetBulanan,
      'id_principal': instance.idPrincipal,
      'kode_outlet': instance.kodeOutlet,
    };
