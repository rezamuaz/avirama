// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.started'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements AuthEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_SignIn with DiagnosticableTreeMixin implements _SignIn {
  const _$_SignIn(this.signIn);

  @override
  final SignIn signIn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signIn(signIn: $signIn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signIn'))
      ..add(DiagnosticsProperty('signIn', signIn));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return signIn(this.signIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return signIn?.call(this.signIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this.signIn);
    }
    return orElse();
  }
}

abstract class _SignIn implements AuthEvent {
  const factory _SignIn(final SignIn signIn) = _$_SignIn;

  SignIn get signIn;
}

/// @nodoc

class _$_SignUp with DiagnosticableTreeMixin implements _SignUp {
  const _$_SignUp(this.signUp);

  @override
  final SignUp signUp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.signUp(signUp: $signUp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.signUp'))
      ..add(DiagnosticsProperty('signUp', signUp));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return signUp(this.signUp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return signUp?.call(this.signUp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this.signUp);
    }
    return orElse();
  }
}

abstract class _SignUp implements AuthEvent {
  const factory _SignUp(final SignUp signUp) = _$_SignUp;

  SignUp get signUp;
}

/// @nodoc

class _$_PhoneNumber with DiagnosticableTreeMixin implements _PhoneNumber {
  const _$_PhoneNumber(this.phoneNumberRequest);

  @override
  final PhoneNumberRequest phoneNumberRequest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.phoneNumber(phoneNumberRequest: $phoneNumberRequest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.phoneNumber'))
      ..add(DiagnosticsProperty('phoneNumberRequest', phoneNumberRequest));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return phoneNumber(phoneNumberRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return phoneNumber?.call(phoneNumberRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (phoneNumber != null) {
      return phoneNumber(phoneNumberRequest);
    }
    return orElse();
  }
}

abstract class _PhoneNumber implements AuthEvent {
  const factory _PhoneNumber(final PhoneNumberRequest phoneNumberRequest) =
      _$_PhoneNumber;

  PhoneNumberRequest get phoneNumberRequest;
}

/// @nodoc

class _$_SocialAccount with DiagnosticableTreeMixin implements _SocialAccount {
  const _$_SocialAccount(this.signInSocialAccount);

  @override
  final SignInSocialAccount signInSocialAccount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.socialAccount(signInSocialAccount: $signInSocialAccount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.socialAccount'))
      ..add(DiagnosticsProperty('signInSocialAccount', signInSocialAccount));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return socialAccount(signInSocialAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return socialAccount?.call(signInSocialAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (socialAccount != null) {
      return socialAccount(signInSocialAccount);
    }
    return orElse();
  }
}

abstract class _SocialAccount implements AuthEvent {
  const factory _SocialAccount(final SignInSocialAccount signInSocialAccount) =
      _$_SocialAccount;

  SignInSocialAccount get signInSocialAccount;
}

/// @nodoc

class _$_CheckData with DiagnosticableTreeMixin implements _CheckData {
  const _$_CheckData();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.checkData()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.checkData'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return checkData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return checkData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (checkData != null) {
      return checkData();
    }
    return orElse();
  }
}

abstract class _CheckData implements AuthEvent {
  const factory _CheckData() = _$_CheckData;
}

/// @nodoc

class _$_ResetPassword with DiagnosticableTreeMixin implements _ResetPassword {
  const _$_ResetPassword(this.resetPassword);

  @override
  final ResetPassword resetPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.resetPassword(resetPassword: $resetPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.resetPassword'))
      ..add(DiagnosticsProperty('resetPassword', resetPassword));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return resetPassword(this.resetPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return resetPassword?.call(this.resetPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this.resetPassword);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements AuthEvent {
  const factory _ResetPassword(final ResetPassword resetPassword) =
      _$_ResetPassword;

  ResetPassword get resetPassword;
}

/// @nodoc

class _$_CheckEmailExists
    with DiagnosticableTreeMixin
    implements _CheckEmailExists {
  const _$_CheckEmailExists(this.email);

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.checkEmailExists(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.checkEmailExists'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return checkEmailExists(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return checkEmailExists?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (checkEmailExists != null) {
      return checkEmailExists(email);
    }
    return orElse();
  }
}

abstract class _CheckEmailExists implements AuthEvent {
  const factory _CheckEmailExists(final String email) = _$_CheckEmailExists;

  String get email;
}

/// @nodoc

class _$_Logout with DiagnosticableTreeMixin implements _Logout {
  const _$_Logout();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.logout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.logout'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignIn signIn) signIn,
    required TResult Function(SignUp signUp) signUp,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        phoneNumber,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        socialAccount,
    required TResult Function() checkData,
    required TResult Function(ResetPassword resetPassword) resetPassword,
    required TResult Function(String email) checkEmailExists,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(SignIn signIn)? signIn,
    TResult? Function(SignUp signUp)? signUp,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult? Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult? Function()? checkData,
    TResult? Function(ResetPassword resetPassword)? resetPassword,
    TResult? Function(String email)? checkEmailExists,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignIn signIn)? signIn,
    TResult Function(SignUp signUp)? signUp,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? phoneNumber,
    TResult Function(SignInSocialAccount signInSocialAccount)? socialAccount,
    TResult Function()? checkData,
    TResult Function(ResetPassword resetPassword)? resetPassword,
    TResult Function(String email)? checkEmailExists,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$_Logout;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc

class _$_IsLoading with DiagnosticableTreeMixin implements _IsLoading {
  const _$_IsLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.isLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.isLoading'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _IsLoading implements AuthState {
  const factory _IsLoading() = _$_IsLoading;
}

/// @nodoc

class _$_IsError with DiagnosticableTreeMixin implements _IsError {
  const _$_IsError(this.error);

  @override
  final NetworkExceptions error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.isError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.isError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return isError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return isError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(error);
    }
    return orElse();
  }
}

abstract class _IsError implements AuthState {
  const factory _IsError(final NetworkExceptions error) = _$_IsError;

  NetworkExceptions get error;
}

/// @nodoc

class _$_Success with DiagnosticableTreeMixin implements _Success {
  const _$_Success(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.success(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.success'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }
}

abstract class _Success implements AuthState {
  const factory _Success(final String message) = _$_Success;

  String get message;
}

/// @nodoc

class _$_IsLogin with DiagnosticableTreeMixin implements _IsLogin {
  const _$_IsLogin(this.user);

  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loggedIn(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loggedIn'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }
}

abstract class _IsLogin implements AuthState {
  const factory _IsLogin(final User? user) = _$_IsLogin;

  User? get user;
}

/// @nodoc

class _$_NotLoggedIn with DiagnosticableTreeMixin implements _NotLoggedIn {
  const _$_NotLoggedIn();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.notLoggedIn()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.notLoggedIn'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return notLoggedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return notLoggedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (notLoggedIn != null) {
      return notLoggedIn();
    }
    return orElse();
  }
}

abstract class _NotLoggedIn implements AuthState {
  const factory _NotLoggedIn() = _$_NotLoggedIn;
}

/// @nodoc

class _$_SendEmailSuccess
    with DiagnosticableTreeMixin
    implements _SendEmailSuccess {
  const _$_SendEmailSuccess(this.message);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.sendEmailSuccess(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.sendEmailSuccess'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return sendEmailSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return sendEmailSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (sendEmailSuccess != null) {
      return sendEmailSuccess(message);
    }
    return orElse();
  }
}

abstract class _SendEmailSuccess implements AuthState {
  const factory _SendEmailSuccess(final String? message) = _$_SendEmailSuccess;

  String? get message;
}

/// @nodoc

class _$_Logouting with DiagnosticableTreeMixin implements _Logouting {
  const _$_Logouting();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.logouting()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.logouting'));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return logouting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return logouting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (logouting != null) {
      return logouting();
    }
    return orElse();
  }
}

abstract class _Logouting implements AuthState {
  const factory _Logouting() = _$_Logouting;
}

/// @nodoc

class _$_SuccessLogout with DiagnosticableTreeMixin implements _SuccessLogout {
  const _$_SuccessLogout(this.message);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.successLogout(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.successLogout'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return successLogout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return successLogout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (successLogout != null) {
      return successLogout(message);
    }
    return orElse();
  }
}

abstract class _SuccessLogout implements AuthState {
  const factory _SuccessLogout(final String? message) = _$_SuccessLogout;

  String? get message;
}

/// @nodoc

class _$_VerifTokenSuccess
    with DiagnosticableTreeMixin
    implements _VerifTokenSuccess {
  const _$_VerifTokenSuccess(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.verifTokenSuccess(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.verifTokenSuccess'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions error) isError,
    required TResult Function(String message) success,
    required TResult Function(User? user) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function(String? message) sendEmailSuccess,
    required TResult Function() logouting,
    required TResult Function(String? message) successLogout,
    required TResult Function(String message) verifTokenSuccess,
  }) {
    return verifTokenSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions error)? isError,
    TResult? Function(String message)? success,
    TResult? Function(User? user)? loggedIn,
    TResult? Function()? notLoggedIn,
    TResult? Function(String? message)? sendEmailSuccess,
    TResult? Function()? logouting,
    TResult? Function(String? message)? successLogout,
    TResult? Function(String message)? verifTokenSuccess,
  }) {
    return verifTokenSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions error)? isError,
    TResult Function(String message)? success,
    TResult Function(User? user)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function(String? message)? sendEmailSuccess,
    TResult Function()? logouting,
    TResult Function(String? message)? successLogout,
    TResult Function(String message)? verifTokenSuccess,
    required TResult orElse(),
  }) {
    if (verifTokenSuccess != null) {
      return verifTokenSuccess(message);
    }
    return orElse();
  }
}

abstract class _VerifTokenSuccess implements AuthState {
  const factory _VerifTokenSuccess(final String message) = _$_VerifTokenSuccess;

  String get message;
}
