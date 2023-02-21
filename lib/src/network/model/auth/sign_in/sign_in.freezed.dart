// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return _SignIn.fromJson(json);
}

/// @nodoc
mixin _$SignIn {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get imei => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_SignIn extends _SignIn {
  const _$_SignIn(
      {required this.email, required this.password, required this.imei})
      : super._();

  factory _$_SignIn.fromJson(Map<String, dynamic> json) =>
      _$$_SignInFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String imei;

  @override
  String toString() {
    return 'SignIn(email: $email, password: $password, imei: $imei)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInToJson(
      this,
    );
  }
}

abstract class _SignIn extends SignIn {
  const factory _SignIn(
      {required final String email,
      required final String password,
      required final String imei}) = _$_SignIn;
  const _SignIn._() : super._();

  factory _SignIn.fromJson(Map<String, dynamic> json) = _$_SignIn.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get imei;
}
