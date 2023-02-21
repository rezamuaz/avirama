// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kompetitor_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KompetitorAktivitas _$$_KompetitorAktivitasFromJson(
        Map<String, dynamic> json) =>
    _$_KompetitorAktivitas(
      id: json['id'] as int?,
      keterangan: json['keterangan'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      idOutlet: json['id_outlet'] as String?,
    );

Map<String, dynamic> _$$_KompetitorAktivitasToJson(
        _$_KompetitorAktivitas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keterangan': instance.keterangan,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id_outlet': instance.idOutlet,
    };
