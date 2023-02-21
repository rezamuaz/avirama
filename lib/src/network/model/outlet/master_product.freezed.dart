// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MasterProductPaging _$MasterProductPagingFromJson(Map<String, dynamic> json) {
  return _MasterProductPaging.fromJson(json);
}

/// @nodoc
mixin _$MasterProductPaging {
  String? get message => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  int? get totalRows => throw _privateConstructorUsedError;
  List<MasterProduct>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_MasterProductPaging implements _MasterProductPaging {
  _$_MasterProductPaging(
      {required this.message,
      required this.currentPage,
      required this.nextPage,
      required this.totalRows,
      required final List<MasterProduct>? data})
      : _data = data;

  factory _$_MasterProductPaging.fromJson(Map<String, dynamic> json) =>
      _$$_MasterProductPagingFromJson(json);

  @override
  final String? message;
  @override
  final int? currentPage;
  @override
  final int? nextPage;
  @override
  final int? totalRows;
  final List<MasterProduct>? _data;
  @override
  List<MasterProduct>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MasterProductPaging(message: $message, currentPage: $currentPage, nextPage: $nextPage, totalRows: $totalRows, data: $data)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_MasterProductPagingToJson(
      this,
    );
  }
}

abstract class _MasterProductPaging implements MasterProductPaging {
  factory _MasterProductPaging(
      {required final String? message,
      required final int? currentPage,
      required final int? nextPage,
      required final int? totalRows,
      required final List<MasterProduct>? data}) = _$_MasterProductPaging;

  factory _MasterProductPaging.fromJson(Map<String, dynamic> json) =
      _$_MasterProductPaging.fromJson;

  @override
  String? get message;
  @override
  int? get currentPage;
  @override
  int? get nextPage;
  @override
  int? get totalRows;
  @override
  List<MasterProduct>? get data;
}

MasterProduct _$MasterProductFromJson(Map<String, dynamic> json) {
  return _MasterProduct.fromJson(json);
}

/// @nodoc
mixin _$MasterProduct {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "code_product", defaultValue: "")
  String? get codeProduct => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "")
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_MasterProduct implements _MasterProduct {
  _$_MasterProduct(
      {required this.id,
      required this.name,
      @JsonKey(name: "code_product", defaultValue: "")
          required this.codeProduct,
      @JsonKey(defaultValue: "")
          required this.description,
      @JsonKey(defaultValue: "")
          required this.price,
      @JsonKey(defaultValue: "")
          required this.image,
      @JsonKey(name: "created_at")
          required this.createdAt,
      @JsonKey(name: "updated_at")
          required this.updatedAt});

  factory _$_MasterProduct.fromJson(Map<String, dynamic> json) =>
      _$$_MasterProductFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: "code_product", defaultValue: "")
  final String? codeProduct;
  @override
  @JsonKey(defaultValue: "")
  final String? description;
  @override
  @JsonKey(defaultValue: "")
  final String? price;
  @override
  @JsonKey(defaultValue: "")
  final String? image;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'MasterProduct(id: $id, name: $name, codeProduct: $codeProduct, description: $description, price: $price, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_MasterProductToJson(
      this,
    );
  }
}

abstract class _MasterProduct implements MasterProduct {
  factory _MasterProduct(
      {required final int? id,
      required final String? name,
      @JsonKey(name: "code_product", defaultValue: "")
          required final String? codeProduct,
      @JsonKey(defaultValue: "")
          required final String? description,
      @JsonKey(defaultValue: "")
          required final String? price,
      @JsonKey(defaultValue: "")
          required final String? image,
      @JsonKey(name: "created_at")
          required final String? createdAt,
      @JsonKey(name: "updated_at")
          required final String? updatedAt}) = _$_MasterProduct;

  factory _MasterProduct.fromJson(Map<String, dynamic> json) =
      _$_MasterProduct.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: "code_product", defaultValue: "")
  String? get codeProduct;
  @override
  @JsonKey(defaultValue: "")
  String? get description;
  @override
  @JsonKey(defaultValue: "")
  String? get price;
  @override
  @JsonKey(defaultValue: "")
  String? get image;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
}
