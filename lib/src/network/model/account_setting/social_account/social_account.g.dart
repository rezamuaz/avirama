// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SocialAccount _$$_SocialAccountFromJson(Map<String, dynamic> json) =>
    _$_SocialAccount(
      id: json['id'] as int,
      provider: json['provider'] as String,
      providerId: json['provider_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$_SocialAccountToJson(_$_SocialAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'provider_id': instance.providerId,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'created_at': instance.createdAt,
    };
