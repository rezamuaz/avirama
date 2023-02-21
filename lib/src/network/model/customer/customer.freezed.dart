// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "nama_customer")
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "no_wa")
  String get phoneNumber => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "buy_for")
  String? get buyFor => throw _privateConstructorUsedError;
  @JsonKey(name: "item_product")
  String? get productItem => throw _privateConstructorUsedError;
  String? get merk => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  @JsonKey(name: "vol_buy")
  String? get buyVol => throw _privateConstructorUsedError;
  @JsonKey(name: "price_bag")
  String? get priceBag => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_Customer extends _Customer {
  const _$_Customer(
      {required this.id,
      @JsonKey(name: "nama_customer") required this.customerName,
      @JsonKey(name: "no_wa") required this.phoneNumber,
      required this.area,
      this.age,
      this.gender,
      this.status,
      @JsonKey(name: "buy_for") this.buyFor,
      @JsonKey(name: "item_product") this.productItem,
      this.merk,
      this.size,
      @JsonKey(name: "vol_buy") this.buyVol,
      @JsonKey(name: "price_bag") this.priceBag,
      this.note})
      : super._();

  factory _$_Customer.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "nama_customer")
  final String customerName;
  @override
  @JsonKey(name: "no_wa")
  final String phoneNumber;
  @override
  final String area;
  @override
  final String? age;
  @override
  final String? gender;
  @override
  final String? status;
  @override
  @JsonKey(name: "buy_for")
  final String? buyFor;
  @override
  @JsonKey(name: "item_product")
  final String? productItem;
  @override
  final String? merk;
  @override
  final String? size;
  @override
  @JsonKey(name: "vol_buy")
  final String? buyVol;
  @override
  @JsonKey(name: "price_bag")
  final String? priceBag;
  @override
  final String? note;

  @override
  String toString() {
    return 'Customer(id: $id, customerName: $customerName, phoneNumber: $phoneNumber, area: $area, age: $age, gender: $gender, status: $status, buyFor: $buyFor, productItem: $productItem, merk: $merk, size: $size, buyVol: $buyVol, priceBag: $priceBag, note: $note)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerToJson(
      this,
    );
  }
}

abstract class _Customer extends Customer {
  const factory _Customer(
      {required final int id,
      @JsonKey(name: "nama_customer") required final String customerName,
      @JsonKey(name: "no_wa") required final String phoneNumber,
      required final String area,
      final String? age,
      final String? gender,
      final String? status,
      @JsonKey(name: "buy_for") final String? buyFor,
      @JsonKey(name: "item_product") final String? productItem,
      final String? merk,
      final String? size,
      @JsonKey(name: "vol_buy") final String? buyVol,
      @JsonKey(name: "price_bag") final String? priceBag,
      final String? note}) = _$_Customer;
  const _Customer._() : super._();

  factory _Customer.fromJson(Map<String, dynamic> json) = _$_Customer.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "nama_customer")
  String get customerName;
  @override
  @JsonKey(name: "no_wa")
  String get phoneNumber;
  @override
  String get area;
  @override
  String? get age;
  @override
  String? get gender;
  @override
  String? get status;
  @override
  @JsonKey(name: "buy_for")
  String? get buyFor;
  @override
  @JsonKey(name: "item_product")
  String? get productItem;
  @override
  String? get merk;
  @override
  String? get size;
  @override
  @JsonKey(name: "vol_buy")
  String? get buyVol;
  @override
  @JsonKey(name: "price_bag")
  String? get priceBag;
  @override
  String? get note;
}

CustomerRequest _$CustomerRequestFromJson(Map<String, dynamic> json) {
  return _CustomerRequest.fromJson(json);
}

/// @nodoc
mixin _$CustomerRequest {
  @JsonKey(name: "nama_customer")
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "no_wa")
  String get phoneNumber => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "buy_for")
  String? get buyFor => throw _privateConstructorUsedError;
  @JsonKey(name: "item_product")
  String? get productItem => throw _privateConstructorUsedError;
  String? get merk => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  @JsonKey(name: "vol_buy")
  String? get buyVol => throw _privateConstructorUsedError;
  @JsonKey(name: "price_bag")
  String? get priceBag => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_CustomerRequest extends _CustomerRequest {
  const _$_CustomerRequest(
      {@JsonKey(name: "nama_customer") required this.customerName,
      @JsonKey(name: "no_wa") required this.phoneNumber,
      required this.area,
      this.age,
      this.gender,
      this.status,
      @JsonKey(name: "buy_for") this.buyFor,
      @JsonKey(name: "item_product") this.productItem,
      this.merk,
      this.size,
      @JsonKey(name: "vol_buy") this.buyVol,
      @JsonKey(name: "price_bag") this.priceBag,
      this.note})
      : super._();

  factory _$_CustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerRequestFromJson(json);

  @override
  @JsonKey(name: "nama_customer")
  final String customerName;
  @override
  @JsonKey(name: "no_wa")
  final String phoneNumber;
  @override
  final String area;
  @override
  final String? age;
  @override
  final String? gender;
  @override
  final String? status;
  @override
  @JsonKey(name: "buy_for")
  final String? buyFor;
  @override
  @JsonKey(name: "item_product")
  final String? productItem;
  @override
  final String? merk;
  @override
  final String? size;
  @override
  @JsonKey(name: "vol_buy")
  final String? buyVol;
  @override
  @JsonKey(name: "price_bag")
  final String? priceBag;
  @override
  final String? note;

  @override
  String toString() {
    return 'CustomerRequest(customerName: $customerName, phoneNumber: $phoneNumber, area: $area, age: $age, gender: $gender, status: $status, buyFor: $buyFor, productItem: $productItem, merk: $merk, size: $size, buyVol: $buyVol, priceBag: $priceBag, note: $note)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerRequestToJson(
      this,
    );
  }
}

abstract class _CustomerRequest extends CustomerRequest {
  const factory _CustomerRequest(
      {@JsonKey(name: "nama_customer") required final String customerName,
      @JsonKey(name: "no_wa") required final String phoneNumber,
      required final String area,
      final String? age,
      final String? gender,
      final String? status,
      @JsonKey(name: "buy_for") final String? buyFor,
      @JsonKey(name: "item_product") final String? productItem,
      final String? merk,
      final String? size,
      @JsonKey(name: "vol_buy") final String? buyVol,
      @JsonKey(name: "price_bag") final String? priceBag,
      final String? note}) = _$_CustomerRequest;
  const _CustomerRequest._() : super._();

  factory _CustomerRequest.fromJson(Map<String, dynamic> json) =
      _$_CustomerRequest.fromJson;

  @override
  @JsonKey(name: "nama_customer")
  String get customerName;
  @override
  @JsonKey(name: "no_wa")
  String get phoneNumber;
  @override
  String get area;
  @override
  String? get age;
  @override
  String? get gender;
  @override
  String? get status;
  @override
  @JsonKey(name: "buy_for")
  String? get buyFor;
  @override
  @JsonKey(name: "item_product")
  String? get productItem;
  @override
  String? get merk;
  @override
  String? get size;
  @override
  @JsonKey(name: "vol_buy")
  String? get buyVol;
  @override
  @JsonKey(name: "price_bag")
  String? get priceBag;
  @override
  String? get note;
}
