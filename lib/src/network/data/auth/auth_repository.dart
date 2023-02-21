import 'package:absensi_app/src/core/api/api_result.dart';

import '../../model/auth/auth_response.dart';
import '../../model/auth/forgot_password/forgot_password.dart';
import '../../model/auth/reset_password/reset_password.dart';
import '../../model/auth/sign_in/phone_number_request.dart';
import '../../model/auth/sign_in/sign_in.dart';
import '../../model/auth/sign_in/sign_in_social_account.dart';
import '../../model/auth/sign_up/sign_up.dart';

abstract class AuthRepository {
  Future<ApiResult<AuthResponse>> fetchUser();

  Future<ApiResult<AuthResponse>> signIn({
    required SignIn signIn,
  });

  Future<ApiResult<AuthResponse>> signUp({
    required SignUp signUp,
  });

  Future<ApiResult<AuthResponse>> signInPhoneNumber({
    required PhoneNumberRequest phoneNumberRequest,
  });

  Future<ApiResult<AuthResponse>> signInSocialAccount({
    required SignInSocialAccount signInSocialAccount,
  });

  Future<ApiResult<String>> signOut();

  Future<ApiResult<String>> forgotPassword({
    required ForgotPassword forgotPassword,
  });

  Future<ApiResult<String>> resetPassword({
    required ResetPassword resetPassword,
  });

  Future<ApiResult<String>> resetPasswordVerifToken({
    required String token,
  });

  Future<ApiResult<String>> checkEmailExists({
    required String email,
  });
}
