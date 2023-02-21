// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OutletInfo _$OutletInfoFromJson(Map<String, dynamic> json) {
  return _OutletInfo.fromJson(json);
}

/// @nodoc
mixin _$OutletInfo {
  @JsonKey(name: "produk", defaultValue: 0)
  int? get product => throw _privateConstructorUsedError;
  @JsonKey(name: "kompetitor", defaultValue: 0)
  int? get competitor => throw _privateConstructorUsedError;
  @JsonKey(name: "promo", defaultValue: 0)
  int? get promo => throw _privateConstructorUsedError;
  @JsonKey(name: "kunjungan", defaultValue: 0)
  int? get kunjungan => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  OutletInfoDetail? get dataOutlet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_OutletInfo implements _OutletInfo {
  _$_OutletInfo(
      {@JsonKey(name: "produk", defaultValue: 0) this.product,
      @JsonKey(name: "kompetitor", defaultValue: 0) this.competitor,
      @JsonKey(name: "promo", defaultValue: 0) this.promo,
      @JsonKey(name: "kunjungan", defaultValue: 0) this.kunjungan,
      @JsonKey(name: "data") this.dataOutlet});

  factory _$_OutletInfo.fromJson(Map<String, dynamic> json) =>
      _$$_OutletInfoFromJson(json);

  @override
  @JsonKey(name: "produk", defaultValue: 0)
  final int? product;
  @override
  @JsonKey(name: "kompetitor", defaultValue: 0)
  final int? competitor;
  @override
  @JsonKey(name: "promo", defaultValue: 0)
  final int? promo;
  @override
  @JsonKey(name: "kunjungan", defaultValue: 0)
  final int? kunjungan;
  @override
  @JsonKey(name: "data")
  final OutletInfoDetail? dataOutlet;

  @override
  String toString() {
    return 'OutletInfo(product: $product, competitor: $competitor, promo: $promo, kunjungan: $kunjungan, dataOutlet: $dataOutlet)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_OutletInfoToJson(
      this,
    );
  }
}

abstract class _OutletInfo implements OutletInfo {
  factory _OutletInfo(
          {@JsonKey(name: "produk", defaultValue: 0) final int? product,
          @JsonKey(name: "kompetitor", defaultValue: 0) final int? competitor,
          @JsonKey(name: "promo", defaultValue: 0) final int? promo,
          @JsonKey(name: "kunjungan", defaultValue: 0) final int? kunjungan,
          @JsonKey(name: "data") final OutletInfoDetail? dataOutlet}) =
      _$_OutletInfo;

  factory _OutletInfo.fromJson(Map<String, dynamic> json) =
      _$_OutletInfo.fromJson;

  @override
  @JsonKey(name: "produk", defaultValue: 0)
  int? get product;
  @override
  @JsonKey(name: "kompetitor", defaultValue: 0)
  int? get competitor;
  @override
  @JsonKey(name: "promo", defaultValue: 0)
  int? get promo;
  @override
  @JsonKey(name: "kunjungan", defaultValue: 0)
  int? get kunjungan;
  @override
  @JsonKey(name: "data")
  OutletInfoDetail? get dataOutlet;
}

OutletInfoDetail _$OutletInfoDetailFromJson(Map<String, dynamic> json) {
  return _OutletInfoDetail.fromJson(json);
}

/// @nodoc
mixin _$OutletInfoDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get radius => throw _privateConstructorUsedError;
  @JsonKey(name: "deleted_at")
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan => throw _privateConstructorUsedError;
  @JsonKey(name: "id_principal")
  String? get idPrincipal => throw _privateConstructorUsedError;
  @JsonKey(name: "kode_outlet")
  String? get kodeOutlet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_OutletInfoDetail implements _OutletInfoDetail {
  _$_OutletInfoDetail(
      {this.id,
      this.name,
      this.address,
      this.long,
      this.lang,
      this.image,
      this.radius,
      @JsonKey(name: "deleted_at") this.deletedAt,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      this.status,
      @JsonKey(name: "target_bulanan") this.targetBulanan,
      @JsonKey(name: "id_principal") this.idPrincipal,
      @JsonKey(name: "kode_outlet") this.kodeOutlet});

  factory _$_OutletInfoDetail.fromJson(Map<String, dynamic> json) =>
      _$$_OutletInfoDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? long;
  @override
  final String? lang;
  @override
  final String? image;
  @override
  final String? radius;
  @override
  @JsonKey(name: "deleted_at")
  final String? deletedAt;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  final String? status;
  @override
  @JsonKey(name: "target_bulanan")
  final String? targetBulanan;
  @override
  @JsonKey(name: "id_principal")
  final String? idPrincipal;
  @override
  @JsonKey(name: "kode_outlet")
  final String? kodeOutlet;

  @override
  String toString() {
    return 'OutletInfoDetail(id: $id, name: $name, address: $address, long: $long, lang: $lang, image: $image, radius: $radius, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, targetBulanan: $targetBulanan, idPrincipal: $idPrincipal, kodeOutlet: $kodeOutlet)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_OutletInfoDetailToJson(
      this,
    );
  }
}

abstract class _OutletInfoDetail implements OutletInfoDetail {
  factory _OutletInfoDetail(
          {final int? id,
          final String? name,
          final String? address,
          final String? long,
          final String? lang,
          final String? image,
          final String? radius,
          @JsonKey(name: "deleted_at") final String? deletedAt,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "updated_at") final String? updatedAt,
          final String? status,
          @JsonKey(name: "target_bulanan") final String? targetBulanan,
          @JsonKey(name: "id_principal") final String? idPrincipal,
          @JsonKey(name: "kode_outlet") final String? kodeOutlet}) =
      _$_OutletInfoDetail;

  factory _OutletInfoDetail.fromJson(Map<String, dynamic> json) =
      _$_OutletInfoDetail.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get long;
  @override
  String? get lang;
  @override
  String? get image;
  @override
  String? get radius;
  @override
  @JsonKey(name: "deleted_at")
  String? get deletedAt;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  String? get status;
  @override
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan;
  @override
  @JsonKey(name: "id_principal")
  String? get idPrincipal;
  @override
  @JsonKey(name: "kode_outlet")
  String? get kodeOutlet;
}
