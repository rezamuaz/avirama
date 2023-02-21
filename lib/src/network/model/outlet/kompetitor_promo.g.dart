// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kompetitor_promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KompetitorPromo _$$_KompetitorPromoFromJson(Map<String, dynamic> json) =>
    _$_KompetitorPromo(
      id: json['id'] as int?,
      namaPromosi: json['nama_promosi'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      idOutlet: json['id_outlet'] as int?,
      harga: json['harga'] as int?,
    );

Map<String, dynamic> _$$_KompetitorPromoToJson(_$_KompetitorPromo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_promosi': instance.namaPromosi,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id_outlet': instance.idOutlet,
      'harga': instance.harga,
    };
