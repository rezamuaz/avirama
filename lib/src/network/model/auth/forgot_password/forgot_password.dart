import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password.freezed.dart';
part 'forgot_password.g.dart';

@freezed
class ForgotPassword with _$ForgotPassword {
  const factory ForgotPassword({
    required String email,
  }) = _ForgotPassword;

  const ForgotPassword._();

  factory ForgotPassword.fromJson(Map<String, dynamic> map) =>
      _$ForgotPasswordFromJson(map);
}
