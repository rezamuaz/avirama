import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up.freezed.dart';
part 'sign_up.g.dart';

@freezed
class SignUp with _$SignUp {
  const factory SignUp({
    required String name,
    required String email,
    required String imei,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String password,
  }) = _SignUp;

  const SignUp._();

  factory SignUp.fromJson(Map<String, dynamic> map) => _$SignUpFromJson(map);
}
