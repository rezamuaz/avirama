// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForgotPassword _$ForgotPasswordFromJson(Map<String, dynamic> json) {
  return _ForgotPassword.fromJson(json);
}

/// @nodoc
mixin _$ForgotPassword {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ForgotPassword extends _ForgotPassword {
  const _$_ForgotPassword({required this.email}) : super._();

  factory _$_ForgotPassword.fromJson(Map<String, dynamic> json) =>
      _$$_ForgotPasswordFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPassword(email: $email)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForgotPasswordToJson(
      this,
    );
  }
}

abstract class _ForgotPassword extends ForgotPassword {
  const factory _ForgotPassword({required final String email}) =
      _$_ForgotPassword;
  const _ForgotPassword._() : super._();

  factory _ForgotPassword.fromJson(Map<String, dynamic> json) =
      _$_ForgotPassword.fromJson;

  @override
  String get email;
}
