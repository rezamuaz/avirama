import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_email_request.freezed.dart';
part 'change_email_request.g.dart';

@freezed
class ChangeEmailRequest with _$ChangeEmailRequest {
  const factory ChangeEmailRequest({
    required String email,
    String? key,
  }) = _ChangeEmailRequest;

  const ChangeEmailRequest._();

  factory ChangeEmailRequest.fromJson(Map<String, dynamic> map) =>
      _$ChangeEmailRequestFromJson(map);
}
