import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

@freezed
class SignIn with _$SignIn {
  const factory SignIn({
    required String email,
    required String password,
    required String imei,
  }) = _SignIn;

  const SignIn._();

  factory SignIn.fromJson(Map<String, dynamic> map) => _$SignInFromJson(map);
}
