// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPassword _$ResetPasswordFromJson(Map<String, dynamic> json) {
  return _ResetPassword.fromJson(json);
}

/// @nodoc
mixin _$ResetPassword {
  String get key => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ResetPassword extends _ResetPassword {
  const _$_ResetPassword({required this.key, required this.password})
      : super._();

  factory _$_ResetPassword.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPasswordFromJson(json);

  @override
  final String key;
  @override
  final String password;

  @override
  String toString() {
    return 'ResetPassword(key: $key, password: $password)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPasswordToJson(
      this,
    );
  }
}

abstract class _ResetPassword extends ResetPassword {
  const factory _ResetPassword(
      {required final String key,
      required final String password}) = _$_ResetPassword;
  const _ResetPassword._() : super._();

  factory _ResetPassword.fromJson(Map<String, dynamic> json) =
      _$_ResetPassword.fromJson;

  @override
  String get key;
  @override
  String get password;
}
