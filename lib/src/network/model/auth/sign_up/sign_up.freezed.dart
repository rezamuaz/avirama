// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUp _$SignUpFromJson(Map<String, dynamic> json) {
  return _SignUp.fromJson(json);
}

/// @nodoc
mixin _$SignUp {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get imei => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_SignUp extends _SignUp {
  const _$_SignUp(
      {required this.name,
      required this.email,
      required this.imei,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      required this.password})
      : super._();

  factory _$_SignUp.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String imei;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUp(name: $name, email: $email, imei: $imei, phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpToJson(
      this,
    );
  }
}

abstract class _SignUp extends SignUp {
  const factory _SignUp(
      {required final String name,
      required final String email,
      required final String imei,
      @JsonKey(name: 'phone_number') required final String phoneNumber,
      required final String password}) = _$_SignUp;
  const _SignUp._() : super._();

  factory _SignUp.fromJson(Map<String, dynamic> json) = _$_SignUp.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get imei;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  String get password;
}
