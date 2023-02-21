import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password.freezed.dart';
part 'change_password.g.dart';

@freezed
class ChangePassword with _$ChangePassword {
  const factory ChangePassword({
    @JsonKey(name: "current_password") String? currentPassword,
    required String password,
  }) = _ChangePassword;

  const ChangePassword._();

  factory ChangePassword.fromJson(Map<String, dynamic> map) =>
      _$ChangePasswordFromJson(map);
}
