part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.signIn(SignIn signIn) = _SignIn;
  const factory AuthEvent.signUp(SignUp signUp) = _SignUp;

  const factory AuthEvent.phoneNumber(
    PhoneNumberRequest phoneNumberRequest,
  ) = _PhoneNumber;

  const factory AuthEvent.socialAccount(
    SignInSocialAccount signInSocialAccount,
  ) = _SocialAccount;

  const factory AuthEvent.checkData() = _CheckData;

  const factory AuthEvent.resetPassword(
    ResetPassword resetPassword,
  ) = _ResetPassword;

  const factory AuthEvent.checkEmailExists(
    String email,
  ) = _CheckEmailExists;

  const factory AuthEvent.logout() = _Logout;
}
