// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_periode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromoPeriode _$$_PromoPeriodeFromJson(Map<String, dynamic> json) =>
    _$_PromoPeriode(
      id: json['id'] as int?,
      idPromo: json['id_promo'] as int?,
      hargaPromo: json['harga_promo'] as int?,
      hargaNormal: json['harga_normal'] as int?,
      keterangan: json['keterangan'] as String?,
      periode: json['periode'] as String?,
      pcs: json['pcs'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_PromoPeriodeToJson(_$_PromoPeriode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_promo': instance.idPromo,
      'harga_promo': instance.hargaPromo,
      'harga_normal': instance.hargaNormal,
      'keterangan': instance.keterangan,
      'periode': instance.periode,
      'pcs': instance.pcs,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
