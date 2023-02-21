part of 'verification_bloc.dart';

@Freezed(
  // Disable the generation of copyWith/==
  copyWith: false,
  equal: false,
  map: FreezedMapOptions(
    map: false,
    mapOrNull: false,
    maybeMap: false,
  ),
)
class VerificationEvent with _$VerificationEvent {
  const factory VerificationEvent.started() = _Started;

  const factory VerificationEvent.sendVerificationCode(
    Future<ApiResult<String>> Function() onSendEmail,
  ) = _SendVerificationCode;

  const factory VerificationEvent.verifyOtp(
    Future<ApiResult<String>> Function(String) onVerifyOtp,
    String otpText,
  ) = _VerifyOtp;
}
