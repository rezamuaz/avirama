import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import '../../model/auth/auth_response.dart';
import '../../model/auth/forgot_password/forgot_password.dart';
import '../../model/auth/reset_password/reset_password.dart';
import '../../model/auth/sign_in/phone_number_request.dart';
import '../../model/auth/sign_in/sign_in.dart';
import '../../model/auth/sign_in/sign_in_social_account.dart';
import '../../model/auth/sign_up/sign_up.dart';
import '../common/http.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  late XHttp http;

  AuthRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<AuthResponse>> fetchUser() async {
    return await http.post(
      '/fetch',
      onSuccess: (response) => AuthResponse.fromJson(response.data),
    );
  }

  @override
  Future<ApiResult<AuthResponse>> signIn({required SignIn signIn}) async {
    Logger().e(signIn.runtimeType);
    return await http.post(
      '/login',
      data: signIn.toJson(),
      onSuccess: (response) => AuthResponse.fromJson(response.data),
    );
  }

  @override
  Future<ApiResult<AuthResponse>> signInPhoneNumber({
    required PhoneNumberRequest phoneNumberRequest,
  }) async {
    return await http.post(
      '/auth/phone-number',
      data: phoneNumberRequest.toJson(),
      onSuccess: (response) => AuthResponse.fromJson(response.data),
    );
  }

  @override
  Future<ApiResult<AuthResponse>> signInSocialAccount({
    required SignInSocialAccount signInSocialAccount,
  }) async {
    return await http.post(
      '/auth/social-account',
      data: signInSocialAccount.toJson(),
      onSuccess: (response) => AuthResponse.fromJson(response.data),
    );
  }

  @override
  Future<ApiResult<AuthResponse>> signUp({required SignUp signUp}) async {
    return await http.post(
      '/register',
      data: signUp.toJson(),
      onSuccess: (response) => AuthResponse.fromJson(response.data),
    );
  }

  @override
  Future<ApiResult<String>> signOut() async {
    return await http.delete('/logout');
  }

  @override
  Future<ApiResult<String>> forgotPassword({
    required ForgotPassword forgotPassword,
  }) async {
    return await http.post(
      '/forgot-password',
      data: forgotPassword.toJson(),
    );
  }

  @override
  Future<ApiResult<String>> resetPassword({
    required ResetPassword resetPassword,
  }) async {
    return await http.post(
      '/reset-password',
      data: resetPassword.toJson(),
    );
  }

  @override
  Future<ApiResult<String>> resetPasswordVerifToken({
    required String token,
  }) async {
    return await http.post('/verif-key/$token');
  }

  @override
  Future<ApiResult<String>> checkEmailExists({
    required String email,
  }) async {
    return await http.post(
      '/check-email-exists',
      data: {'email': email},
    );
  }
}
