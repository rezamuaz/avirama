import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_social_account.freezed.dart';
part 'sign_in_social_account.g.dart';

@freezed
class SignInSocialAccount with _$SignInSocialAccount {
  const factory SignInSocialAccount({
    required String provider,
    required String token,
  }) = _SignInSocialAccount;

  const SignInSocialAccount._();

  factory SignInSocialAccount.fromJson(Map<String, dynamic> map) =>
      _$SignInSocialAccountFromJson(map);
}
