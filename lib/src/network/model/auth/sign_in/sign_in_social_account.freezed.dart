// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_social_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInSocialAccount _$SignInSocialAccountFromJson(Map<String, dynamic> json) {
  return _SignInSocialAccount.fromJson(json);
}

/// @nodoc
mixin _$SignInSocialAccount {
  String get provider => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_SignInSocialAccount extends _SignInSocialAccount {
  const _$_SignInSocialAccount({required this.provider, required this.token})
      : super._();

  factory _$_SignInSocialAccount.fromJson(Map<String, dynamic> json) =>
      _$$_SignInSocialAccountFromJson(json);

  @override
  final String provider;
  @override
  final String token;

  @override
  String toString() {
    return 'SignInSocialAccount(provider: $provider, token: $token)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInSocialAccountToJson(
      this,
    );
  }
}

abstract class _SignInSocialAccount extends SignInSocialAccount {
  const factory _SignInSocialAccount(
      {required final String provider,
      required final String token}) = _$_SignInSocialAccount;
  const _SignInSocialAccount._() : super._();

  factory _SignInSocialAccount.fromJson(Map<String, dynamic> json) =
      _$_SignInSocialAccount.fromJson;

  @override
  String get provider;
  @override
  String get token;
}
