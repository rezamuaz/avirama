import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password.freezed.dart';
part 'reset_password.g.dart';

@freezed
class ResetPassword with _$ResetPassword {
  const factory ResetPassword({
    required String key,
    required String password,
  }) = _ResetPassword;

  const ResetPassword._();

  factory ResetPassword.fromJson(Map<String, dynamic> map) =>
      _$ResetPasswordFromJson(map);
}
