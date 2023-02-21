// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialAccount _$SocialAccountFromJson(Map<String, dynamic> json) {
  return _SocialAccount.fromJson(json);
}

/// @nodoc
mixin _$SocialAccount {
  int get id => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_id')
  String get providerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_SocialAccount extends _SocialAccount {
  const _$_SocialAccount(
      {required this.id,
      required this.provider,
      @JsonKey(name: 'provider_id') required this.providerId,
      required this.name,
      this.email,
      this.avatar,
      @JsonKey(name: 'created_at') required this.createdAt})
      : super._();

  factory _$_SocialAccount.fromJson(Map<String, dynamic> json) =>
      _$$_SocialAccountFromJson(json);

  @override
  final int id;
  @override
  final String provider;
  @override
  @JsonKey(name: 'provider_id')
  final String providerId;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? avatar;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'SocialAccount(id: $id, provider: $provider, providerId: $providerId, name: $name, email: $email, avatar: $avatar, createdAt: $createdAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocialAccountToJson(
      this,
    );
  }
}

abstract class _SocialAccount extends SocialAccount {
  const factory _SocialAccount(
          {required final int id,
          required final String provider,
          @JsonKey(name: 'provider_id') required final String providerId,
          required final String name,
          final String? email,
          final String? avatar,
          @JsonKey(name: 'created_at') required final String createdAt}) =
      _$_SocialAccount;
  const _SocialAccount._() : super._();

  factory _SocialAccount.fromJson(Map<String, dynamic> json) =
      _$_SocialAccount.fromJson;

  @override
  int get id;
  @override
  String get provider;
  @override
  @JsonKey(name: 'provider_id')
  String get providerId;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get avatar;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
}
