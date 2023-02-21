import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_account.freezed.dart';
part 'social_account.g.dart';

@freezed
class SocialAccount with _$SocialAccount {
  const factory SocialAccount({
    required int id,
    required String provider,
    @JsonKey(name: 'provider_id') required String providerId,
    required String name,
    String? email,
    String? avatar,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _SocialAccount;

  const SocialAccount._();

  factory SocialAccount.fromJson(Map<String, dynamic> map) =>
      _$SocialAccountFromJson(map);
}
