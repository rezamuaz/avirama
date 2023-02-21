// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kompetitor_promo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KompetitorPromo _$KompetitorPromoFromJson(Map<String, dynamic> json) {
  return _KompetitorPromo.fromJson(json);
}

/// @nodoc
mixin _$KompetitorPromo {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "nama_promosi")
  String? get namaPromosi => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "id_outlet")
  int? get idOutlet => throw _privateConstructorUsedError;
  int? get harga => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_KompetitorPromo implements _KompetitorPromo {
  _$_KompetitorPromo(
      {this.id,
      @JsonKey(name: "nama_promosi") this.namaPromosi,
      this.image,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "id_outlet") this.idOutlet,
      this.harga});

  factory _$_KompetitorPromo.fromJson(Map<String, dynamic> json) =>
      _$$_KompetitorPromoFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "nama_promosi")
  final String? namaPromosi;
  @override
  final String? image;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "id_outlet")
  final int? idOutlet;
  @override
  final int? harga;

  @override
  String toString() {
    return 'KompetitorPromo(id: $id, namaPromosi: $namaPromosi, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, idOutlet: $idOutlet, harga: $harga)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_KompetitorPromoToJson(
      this,
    );
  }
}

abstract class _KompetitorPromo implements KompetitorPromo {
  factory _KompetitorPromo(
      {final int? id,
      @JsonKey(name: "nama_promosi") final String? namaPromosi,
      final String? image,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at") final String? updatedAt,
      @JsonKey(name: "id_outlet") final int? idOutlet,
      final int? harga}) = _$_KompetitorPromo;

  factory _KompetitorPromo.fromJson(Map<String, dynamic> json) =
      _$_KompetitorPromo.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "nama_promosi")
  String? get namaPromosi;
  @override
  String? get image;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "id_outlet")
  int? get idOutlet;
  @override
  int? get harga;
}
