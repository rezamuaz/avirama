// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectOutlet _$SelectOutletFromJson(Map<String, dynamic> json) {
  return _SelectOutlet.fromJson(json);
}

/// @nodoc
mixin _$SelectOutlet {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String get radius => throw _privateConstructorUsedError;
  bool? get is_complete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_SelectOutlet extends _SelectOutlet {
  const _$_SelectOutlet(
      {required this.id,
      required this.name,
      required this.address,
      required this.long,
      required this.lang,
      required this.radius,
      this.is_complete})
      : super._();

  factory _$_SelectOutlet.fromJson(Map<String, dynamic> json) =>
      _$$_SelectOutletFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String? long;
  @override
  final String? lang;
  @override
  final String radius;
  @override
  final bool? is_complete;

  @override
  String toString() {
    return 'SelectOutlet(id: $id, name: $name, address: $address, long: $long, lang: $lang, radius: $radius, is_complete: $is_complete)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectOutletToJson(
      this,
    );
  }
}

abstract class _SelectOutlet extends SelectOutlet {
  const factory _SelectOutlet(
      {required final String id,
      required final String name,
      required final String address,
      required final String? long,
      required final String? lang,
      required final String radius,
      final bool? is_complete}) = _$_SelectOutlet;
  const _SelectOutlet._() : super._();

  factory _SelectOutlet.fromJson(Map<String, dynamic> json) =
      _$_SelectOutlet.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String? get long;
  @override
  String? get lang;
  @override
  String get radius;
  @override
  bool? get is_complete;
}

Outlet _$OutletFromJson(Map<String, dynamic> json) {
  return _Outlet.fromJson(json);
}

/// @nodoc
mixin _$Outlet {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get radius => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_Outlet extends _Outlet {
  const _$_Outlet(
      {required this.id,
      required this.name,
      required this.address,
      required this.long,
      required this.lang,
      this.image,
      this.radius,
      this.status,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "target_bulanan") this.targetBulanan})
      : super._();

  factory _$_Outlet.fromJson(Map<String, dynamic> json) =>
      _$$_OutletFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String? long;
  @override
  final String? lang;
  @override
  final String? image;
  @override
  final String? radius;
  @override
  final String? status;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "target_bulanan")
  final String? targetBulanan;

  @override
  String toString() {
    return 'Outlet(id: $id, name: $name, address: $address, long: $long, lang: $lang, image: $image, radius: $radius, status: $status, createdAt: $createdAt, targetBulanan: $targetBulanan)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_OutletToJson(
      this,
    );
  }
}

abstract class _Outlet extends Outlet {
  const factory _Outlet(
          {required final int id,
          required final String name,
          required final String address,
          required final String? long,
          required final String? lang,
          final String? image,
          final String? radius,
          final String? status,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "target_bulanan") final String? targetBulanan}) =
      _$_Outlet;
  const _Outlet._() : super._();

  factory _Outlet.fromJson(Map<String, dynamic> json) = _$_Outlet.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String? get long;
  @override
  String? get lang;
  @override
  String? get image;
  @override
  String? get radius;
  @override
  String? get status;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan;
}

OutletRequest _$OutletRequestFromJson(Map<String, dynamic> json) {
  return _OutletRequest.fromJson(json);
}

/// @nodoc
mixin _$OutletRequest {
  String get name => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String get radius => throw _privateConstructorUsedError; // String? image,
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutletRequestCopyWith<OutletRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletRequestCopyWith<$Res> {
  factory $OutletRequestCopyWith(
          OutletRequest value, $Res Function(OutletRequest) then) =
      _$OutletRequestCopyWithImpl<$Res, OutletRequest>;
  @useResult
  $Res call(
      {String name,
      String? long,
      String? lang,
      String radius,
      String? address,
      @JsonKey(name: "target_bulanan") String? targetBulanan});
}

/// @nodoc
class _$OutletRequestCopyWithImpl<$Res, $Val extends OutletRequest>
    implements $OutletRequestCopyWith<$Res> {
  _$OutletRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? long = freezed,
    Object? lang = freezed,
    Object? radius = null,
    Object? address = freezed,
    Object? targetBulanan = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBulanan: freezed == targetBulanan
          ? _value.targetBulanan
          : targetBulanan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OutletRequestCopyWith<$Res>
    implements $OutletRequestCopyWith<$Res> {
  factory _$$_OutletRequestCopyWith(
          _$_OutletRequest value, $Res Function(_$_OutletRequest) then) =
      __$$_OutletRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? long,
      String? lang,
      String radius,
      String? address,
      @JsonKey(name: "target_bulanan") String? targetBulanan});
}

/// @nodoc
class __$$_OutletRequestCopyWithImpl<$Res>
    extends _$OutletRequestCopyWithImpl<$Res, _$_OutletRequest>
    implements _$$_OutletRequestCopyWith<$Res> {
  __$$_OutletRequestCopyWithImpl(
      _$_OutletRequest _value, $Res Function(_$_OutletRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? long = freezed,
    Object? lang = freezed,
    Object? radius = null,
    Object? address = freezed,
    Object? targetBulanan = freezed,
  }) {
    return _then(_$_OutletRequest(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBulanan: freezed == targetBulanan
          ? _value.targetBulanan
          : targetBulanan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OutletRequest extends _OutletRequest {
  const _$_OutletRequest(
      {required this.name,
      this.long,
      this.lang,
      required this.radius,
      this.address,
      @JsonKey(name: "target_bulanan") this.targetBulanan})
      : super._();

  factory _$_OutletRequest.fromJson(Map<String, dynamic> json) =>
      _$$_OutletRequestFromJson(json);

  @override
  final String name;
  @override
  final String? long;
  @override
  final String? lang;
  @override
  final String radius;
// String? image,
  @override
  final String? address;
  @override
  @JsonKey(name: "target_bulanan")
  final String? targetBulanan;

  @override
  String toString() {
    return 'OutletRequest(name: $name, long: $long, lang: $lang, radius: $radius, address: $address, targetBulanan: $targetBulanan)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OutletRequestCopyWith<_$_OutletRequest> get copyWith =>
      __$$_OutletRequestCopyWithImpl<_$_OutletRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OutletRequestToJson(
      this,
    );
  }
}

abstract class _OutletRequest extends OutletRequest {
  const factory _OutletRequest(
          {required final String name,
          final String? long,
          final String? lang,
          required final String radius,
          final String? address,
          @JsonKey(name: "target_bulanan") final String? targetBulanan}) =
      _$_OutletRequest;
  const _OutletRequest._() : super._();

  factory _OutletRequest.fromJson(Map<String, dynamic> json) =
      _$_OutletRequest.fromJson;

  @override
  String get name;
  @override
  String? get long;
  @override
  String? get lang;
  @override
  String get radius;
  @override // String? image,
  String? get address;
  @override
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan;
  @override
  @JsonKey(ignore: true)
  _$$_OutletRequestCopyWith<_$_OutletRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
