// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_outlet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOutletPaging _$ProductOutletPagingFromJson(Map<String, dynamic> json) {
  return _ProductOutletPaging.fromJson(json);
}

/// @nodoc
mixin _$ProductOutletPaging {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<ProductOutlet>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ProductOutletPaging implements _ProductOutletPaging {
  _$_ProductOutletPaging(
      {this.status,
      this.message,
      @JsonKey(defaultValue: []) required final List<ProductOutlet>? data})
      : _data = data;

  factory _$_ProductOutletPaging.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOutletPagingFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  final List<ProductOutlet>? _data;
  @override
  @JsonKey(defaultValue: [])
  List<ProductOutlet>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductOutletPaging(status: $status, message: $message, data: $data)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOutletPagingToJson(
      this,
    );
  }
}

abstract class _ProductOutletPaging implements ProductOutletPaging {
  factory _ProductOutletPaging(
      {final bool? status,
      final String? message,
      @JsonKey(defaultValue: [])
          required final List<ProductOutlet>? data}) = _$_ProductOutletPaging;

  factory _ProductOutletPaging.fromJson(Map<String, dynamic> json) =
      _$_ProductOutletPaging.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  @JsonKey(defaultValue: [])
  List<ProductOutlet>? get data;
}

ProductOutlet _$ProductOutletFromJson(Map<String, dynamic> json) {
  return _ProductOutlet.fromJson(json);
}

/// @nodoc
mixin _$ProductOutlet {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_id')
  String? get outletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  DetailProdukData? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ProductOutlet implements _ProductOutlet {
  _$_ProductOutlet(
      {required this.id,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'outlet_id') required this.outletId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.product});

  factory _$_ProductOutlet.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOutletFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'product_id')
  final String? productId;
  @override
  @JsonKey(name: 'outlet_id')
  final String? outletId;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final DetailProdukData? product;

  @override
  String toString() {
    return 'ProductOutlet(id: $id, productId: $productId, outletId: $outletId, userId: $userId, product: $product)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOutletToJson(
      this,
    );
  }
}

abstract class _ProductOutlet implements ProductOutlet {
  factory _ProductOutlet(
      {required final String? id,
      @JsonKey(name: 'product_id') required final String? productId,
      @JsonKey(name: 'outlet_id') required final String? outletId,
      @JsonKey(name: 'user_id') required final String? userId,
      required final DetailProdukData? product}) = _$_ProductOutlet;

  factory _ProductOutlet.fromJson(Map<String, dynamic> json) =
      _$_ProductOutlet.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'product_id')
  String? get productId;
  @override
  @JsonKey(name: 'outlet_id')
  String? get outletId;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  DetailProdukData? get product;
}

DetailProdukData _$DetailProdukDataFromJson(Map<String, dynamic> json) {
  return _DetailProdukData.fromJson(json);
}

/// @nodoc
mixin _$DetailProdukData {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get omset => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_unit')
  int? get pricePerUnit => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_DetailProdukData implements _DetailProdukData {
  _$_DetailProdukData(
      {required this.id,
      required this.name,
      required this.omset,
      required this.description,
      required this.price,
      @JsonKey(name: 'price_per_unit') required this.pricePerUnit,
      required this.image,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$_DetailProdukData.fromJson(Map<String, dynamic> json) =>
      _$$_DetailProdukDataFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? omset;
  @override
  final String? description;
  @override
  final int? price;
  @override
  @JsonKey(name: 'price_per_unit')
  final int? pricePerUnit;
  @override
  final String? image;
  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'DetailProdukData(id: $id, name: $name, omset: $omset, description: $description, price: $price, pricePerUnit: $pricePerUnit, image: $image, categoryId: $categoryId, updatedAt: $updatedAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailProdukDataToJson(
      this,
    );
  }
}

abstract class _DetailProdukData implements DetailProdukData {
  factory _DetailProdukData(
          {required final String? id,
          required final String? name,
          required final int? omset,
          required final String? description,
          required final int? price,
          @JsonKey(name: 'price_per_unit') required final int? pricePerUnit,
          required final String? image,
          @JsonKey(name: 'category_id') required final String? categoryId,
          @JsonKey(name: 'updated_at') required final String? updatedAt}) =
      _$_DetailProdukData;

  factory _DetailProdukData.fromJson(Map<String, dynamic> json) =
      _$_DetailProdukData.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get omset;
  @override
  String? get description;
  @override
  int? get price;
  @override
  @JsonKey(name: 'price_per_unit')
  int? get pricePerUnit;
  @override
  String? get image;
  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
}

ProductOutletAdd _$ProductOutletAddFromJson(Map<String, dynamic> json) {
  return _ProductOutletAdd.fromJson(json);
}

/// @nodoc
mixin _$ProductOutletAdd {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ProductOutletAdd implements _ProductOutletAdd {
  _$_ProductOutletAdd({required this.status, required this.message});

  factory _$_ProductOutletAdd.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOutletAddFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'ProductOutletAdd(status: $status, message: $message)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOutletAddToJson(
      this,
    );
  }
}

abstract class _ProductOutletAdd implements ProductOutletAdd {
  factory _ProductOutletAdd(
      {required final bool? status,
      required final String? message}) = _$_ProductOutletAdd;

  factory _ProductOutletAdd.fromJson(Map<String, dynamic> json) =
      _$_ProductOutletAdd.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
}
