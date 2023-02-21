part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.isLoading() = _IsLoading;
  const factory AuthState.isError(NetworkExceptions error) = _IsError;

  const factory AuthState.success(String message) = _Success;

  const factory AuthState.loggedIn(User? user) = _IsLogin;
  const factory AuthState.notLoggedIn() = _NotLoggedIn;

  const factory AuthState.sendEmailSuccess(String? message) = _SendEmailSuccess;

  const factory AuthState.logouting() = _Logouting;
  const factory AuthState.successLogout(String? message) = _SuccessLogout;

  const factory AuthState.verifTokenSuccess(
    String message,
  ) = _VerifTokenSuccess;
}
