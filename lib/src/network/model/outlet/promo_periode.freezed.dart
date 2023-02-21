// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_periode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromoPeriode _$PromoPeriodeFromJson(Map<String, dynamic> json) {
  return _PromoPeriode.fromJson(json);
}

/// @nodoc
mixin _$PromoPeriode {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "id_promo")
  int? get idPromo => throw _privateConstructorUsedError;
  @JsonKey(name: "harga_promo")
  int? get hargaPromo => throw _privateConstructorUsedError;
  @JsonKey(name: "harga_normal")
  int? get hargaNormal => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;
  String? get periode => throw _privateConstructorUsedError;
  String? get pcs => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_PromoPeriode implements _PromoPeriode {
  _$_PromoPeriode(
      {this.id,
      @JsonKey(name: "id_promo") this.idPromo,
      @JsonKey(name: "harga_promo") this.hargaPromo,
      @JsonKey(name: "harga_normal") this.hargaNormal,
      this.keterangan,
      this.periode,
      this.pcs,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$_PromoPeriode.fromJson(Map<String, dynamic> json) =>
      _$$_PromoPeriodeFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "id_promo")
  final int? idPromo;
  @override
  @JsonKey(name: "harga_promo")
  final int? hargaPromo;
  @override
  @JsonKey(name: "harga_normal")
  final int? hargaNormal;
  @override
  final String? keterangan;
  @override
  final String? periode;
  @override
  final String? pcs;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'PromoPeriode(id: $id, idPromo: $idPromo, hargaPromo: $hargaPromo, hargaNormal: $hargaNormal, keterangan: $keterangan, periode: $periode, pcs: $pcs, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromoPeriodeToJson(
      this,
    );
  }
}

abstract class _PromoPeriode implements PromoPeriode {
  factory _PromoPeriode(
      {final int? id,
      @JsonKey(name: "id_promo") final int? idPromo,
      @JsonKey(name: "harga_promo") final int? hargaPromo,
      @JsonKey(name: "harga_normal") final int? hargaNormal,
      final String? keterangan,
      final String? periode,
      final String? pcs,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt}) = _$_PromoPeriode;

  factory _PromoPeriode.fromJson(Map<String, dynamic> json) =
      _$_PromoPeriode.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "id_promo")
  int? get idPromo;
  @override
  @JsonKey(name: "harga_promo")
  int? get hargaPromo;
  @override
  @JsonKey(name: "harga_normal")
  int? get hargaNormal;
  @override
  String? get keterangan;
  @override
  String? get periode;
  @override
  String? get pcs;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
}
