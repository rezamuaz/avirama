// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kompetitor_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KompetitorProduct _$$_KompetitorProductFromJson(Map<String, dynamic> json) =>
    _$_KompetitorProduct(
      id: json['id'] as int?,
      brandId: json['brand_id'] as String?,
      name: json['name'] as String?,
      cat: json['cat'] as String?,
      promo: json['promo'] as String?,
      priode: json['priode'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      image: json['image'] as String?,
      omset: json['omset'] as int?,
      idOutlet: json['id_outlet'] as int?,
    );

Map<String, dynamic> _$$_KompetitorProductToJson(
        _$_KompetitorProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'name': instance.name,
      'cat': instance.cat,
      'promo': instance.promo,
      'priode': instance.priode,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'image': instance.image,
      'omset': instance.omset,
      'id_outlet': instance.idOutlet,
    };
