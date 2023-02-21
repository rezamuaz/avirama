// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kompetitor_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KompetitorProduct _$KompetitorProductFromJson(Map<String, dynamic> json) {
  return _KompetitorProduct.fromJson(json);
}

/// @nodoc
mixin _$KompetitorProduct {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "brand_id")
  String? get brandId =>
      throw _privateConstructorUsedError; // @JsonKey(name: "unit_id") String? unitId,
// @JsonKey(name: "unit_pack_id") String? unitPackId,
  String? get name => throw _privateConstructorUsedError; // int? price,
// @JsonKey(name: "price_per_unit") String? pricePerUnit,
// String? size,
// String? vol,
// String? pack,
// String? type,
  String? get cat => throw _privateConstructorUsedError;
  String? get promo => throw _privateConstructorUsedError;
  String? get priode => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get omset => throw _privateConstructorUsedError;
  @JsonKey(name: "id_outlet")
  int? get idOutlet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_KompetitorProduct implements _KompetitorProduct {
  _$_KompetitorProduct(
      {this.id,
      @JsonKey(name: "brand_id") this.brandId,
      this.name,
      this.cat,
      this.promo,
      this.priode,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      this.image,
      this.omset,
      @JsonKey(name: "id_outlet") this.idOutlet});

  factory _$_KompetitorProduct.fromJson(Map<String, dynamic> json) =>
      _$$_KompetitorProductFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "brand_id")
  final String? brandId;
// @JsonKey(name: "unit_id") String? unitId,
// @JsonKey(name: "unit_pack_id") String? unitPackId,
  @override
  final String? name;
// int? price,
// @JsonKey(name: "price_per_unit") String? pricePerUnit,
// String? size,
// String? vol,
// String? pack,
// String? type,
  @override
  final String? cat;
  @override
  final String? promo;
  @override
  final String? priode;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  final String? image;
  @override
  final int? omset;
  @override
  @JsonKey(name: "id_outlet")
  final int? idOutlet;

  @override
  String toString() {
    return 'KompetitorProduct(id: $id, brandId: $brandId, name: $name, cat: $cat, promo: $promo, priode: $priode, createdAt: $createdAt, updatedAt: $updatedAt, image: $image, omset: $omset, idOutlet: $idOutlet)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_KompetitorProductToJson(
      this,
    );
  }
}

abstract class _KompetitorProduct implements KompetitorProduct {
  factory _KompetitorProduct(
      {final int? id,
      @JsonKey(name: "brand_id") final String? brandId,
      final String? name,
      final String? cat,
      final String? promo,
      final String? priode,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      final String? image,
      final int? omset,
      @JsonKey(name: "id_outlet") final int? idOutlet}) = _$_KompetitorProduct;

  factory _KompetitorProduct.fromJson(Map<String, dynamic> json) =
      _$_KompetitorProduct.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "brand_id")
  String? get brandId;
  @override // @JsonKey(name: "unit_id") String? unitId,
// @JsonKey(name: "unit_pack_id") String? unitPackId,
  String? get name;
  @override // int? price,
// @JsonKey(name: "price_per_unit") String? pricePerUnit,
// String? size,
// String? vol,
// String? pack,
// String? type,
  String? get cat;
  @override
  String? get promo;
  @override
  String? get priode;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  String? get image;
  @override
  int? get omset;
  @override
  @JsonKey(name: "id_outlet")
  int? get idOutlet;
}
