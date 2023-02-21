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
class VerificationState with _$VerificationState {
  const factory VerificationState.initial() = _Initial;
  const factory VerificationState.isLoading() = _IsLoading;
  const factory VerificationState.isSending() = _IsSending;
  const factory VerificationState.isError(
    NetworkExceptions networkExceptions,
  ) = _IsError;

  const factory VerificationState.successSend() = _SuccessSend;
  const factory VerificationState.successVerify(
    String otpText,
  ) = _SuccessVerify;
}
