// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Future<ApiResult<String>> Function() onSendEmail)
        sendVerificationCode,
    required TResult Function(
            Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)
        verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult? Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'VerificationEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Future<ApiResult<String>> Function() onSendEmail)
        sendVerificationCode,
    required TResult Function(
            Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)
        verifyOtp,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult? Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements VerificationEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_SendVerificationCode implements _SendVerificationCode {
  const _$_SendVerificationCode(this.onSendEmail);

  @override
  final Future<ApiResult<String>> Function() onSendEmail;

  @override
  String toString() {
    return 'VerificationEvent.sendVerificationCode(onSendEmail: $onSendEmail)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Future<ApiResult<String>> Function() onSendEmail)
        sendVerificationCode,
    required TResult Function(
            Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)
        verifyOtp,
  }) {
    return sendVerificationCode(onSendEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult? Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
  }) {
    return sendVerificationCode?.call(onSendEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
    required TResult orElse(),
  }) {
    if (sendVerificationCode != null) {
      return sendVerificationCode(onSendEmail);
    }
    return orElse();
  }
}

abstract class _SendVerificationCode implements VerificationEvent {
  const factory _SendVerificationCode(
          final Future<ApiResult<String>> Function() onSendEmail) =
      _$_SendVerificationCode;

  Future<ApiResult<String>> Function() get onSendEmail;
}

/// @nodoc

class _$_VerifyOtp implements _VerifyOtp {
  const _$_VerifyOtp(this.onVerifyOtp, this.otpText);

  @override
  final Future<ApiResult<String>> Function(String) onVerifyOtp;
  @override
  final String otpText;

  @override
  String toString() {
    return 'VerificationEvent.verifyOtp(onVerifyOtp: $onVerifyOtp, otpText: $otpText)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Future<ApiResult<String>> Function() onSendEmail)
        sendVerificationCode,
    required TResult Function(
            Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)
        verifyOtp,
  }) {
    return verifyOtp(onVerifyOtp, otpText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult? Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
  }) {
    return verifyOtp?.call(onVerifyOtp, otpText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Future<ApiResult<String>> Function() onSendEmail)?
        sendVerificationCode,
    TResult Function(Future<ApiResult<String>> Function(String) onVerifyOtp,
            String otpText)?
        verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(onVerifyOtp, otpText);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements VerificationEvent {
  const factory _VerifyOtp(
      final Future<ApiResult<String>> Function(String) onVerifyOtp,
      final String otpText) = _$_VerifyOtp;

  Future<ApiResult<String>> Function(String) get onVerifyOtp;
  String get otpText;
}

/// @nodoc
mixin _$VerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() isSending,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function() successSend,
    required TResult Function(String otpText) successVerify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? isSending,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function()? successSend,
    TResult? Function(String otpText)? successVerify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? isSending,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function()? successSend,
    TResult Function(String otpText)? successVerify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'VerificationState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() isSending,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function() successSend,
    required TResult Function(String otpText) successVerify,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? isSending,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function()? successSend,
    TResult? Function(String otpText)? successVerify,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? isSending,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function()? successSend,
    TResult Function(String otpText)? successVerify,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial implements VerificationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc

class _$_IsLoading implements _IsLoading {
  const _$_IsLoading();

  @override
  String toString() {
    return 'VerificationState.isLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() isSending,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function() successSend,
    required TResult Function(String otpText) successVerify,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? isSending,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function()? successSend,
    TResult? Function(String otpText)? successVerify,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? isSending,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function()? successSend,
    TResult Function(String otpText)? successVerify,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _IsLoading implements VerificationState {
  const factory _IsLoading() = _$_IsLoading;
}

/// @nodoc

class _$_IsSending implements _IsSending {
  const _$_IsSending();

  @override
  String toString() {
    return 'VerificationState.isSending()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() isSending,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function() successSend,
    required TResult Function(String otpText) successVerify,
  }) {
    return isSending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? isSending,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function()? successSend,
    TResult? Function(String otpText)? successVerify,
  }) {
    return isSending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? isSending,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function()? successSend,
    TResult Function(String otpText)? successVerify,
    required TResult orElse(),
  }) {
    if (isSending != null) {
      return isSending();
    }
    return orElse();
  }
}

abstract class _IsSending implements VerificationState {
  const factory _IsSending() = _$_IsSending;
}

/// @nodoc

class _$_IsError implements _IsError {
  const _$_IsError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'VerificationState.isError(networkExceptions: $networkExceptions)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() isSending,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function() successSend,
    required TResult Function(String otpText) successVerify,
  }) {
    return isError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? isSending,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function()? successSend,
    TResult? Function(String otpText)? successVerify,
  }) {
    return isError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? isSending,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function()? successSend,
    TResult Function(String otpText)? successVerify,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(networkExceptions);
    }
    return orElse();
  }
}

abstract class _IsError implements VerificationState {
  const factory _IsError(final NetworkExceptions networkExceptions) =
      _$_IsError;

  NetworkExceptions get networkExceptions;
}

/// @nodoc

class _$_SuccessSend implements _SuccessSend {
  const _$_SuccessSend();

  @override
  String toString() {
    return 'VerificationState.successSend()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() isSending,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function() successSend,
    required TResult Function(String otpText) successVerify,
  }) {
    return successSend();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? isSending,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function()? successSend,
    TResult? Function(String otpText)? successVerify,
  }) {
    return successSend?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? isSending,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function()? successSend,
    TResult Function(String otpText)? successVerify,
    required TResult orElse(),
  }) {
    if (successSend != null) {
      return successSend();
    }
    return orElse();
  }
}

abstract class _SuccessSend implements VerificationState {
  const factory _SuccessSend() = _$_SuccessSend;
}

/// @nodoc

class _$_SuccessVerify implements _SuccessVerify {
  const _$_SuccessVerify(this.otpText);

  @override
  final String otpText;

  @override
  String toString() {
    return 'VerificationState.successVerify(otpText: $otpText)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() isSending,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function() successSend,
    required TResult Function(String otpText) successVerify,
  }) {
    return successVerify(otpText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? isSending,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function()? successSend,
    TResult? Function(String otpText)? successVerify,
  }) {
    return successVerify?.call(otpText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? isSending,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function()? successSend,
    TResult Function(String otpText)? successVerify,
    required TResult orElse(),
  }) {
    if (successVerify != null) {
      return successVerify(otpText);
    }
    return orElse();
  }
}

abstract class _SuccessVerify implements VerificationState {
  const factory _SuccessVerify(final String otpText) = _$_SuccessVerify;

  String get otpText;
}
