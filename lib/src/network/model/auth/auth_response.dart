import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required User data,
    @JsonKey(name: 'access_token') required String bearerToken,
  }) = _AuthResponse;

  const AuthResponse._();

  factory AuthResponse.fromJson(Map<String, dynamic> map) =>
      _$AuthResponseFromJson(map);
}
