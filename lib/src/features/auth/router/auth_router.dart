import 'package:auto_route/auto_route.dart';

import '../../../router/router_name.dart';
import '../view/forgot_password_view.dart';
import '../view/new_password_view.dart';
import '../view/sign_in_view.dart.dart';
import '../view/sign_in_with_phone_number_view.dart';
import '../view/sign_up_view.dart';
import 'auth_wrapper_view.dart';

class AuthRouters {
  static const String signIn = '';

  static const String signUp = 'sign-up';
  static const String forgotPassword = 'forgot-password';
  static const String emailVerfication = 'email-verfication';
  static const String newPassword = 'new-password';

  static const String signWithPhoneNumber = 'phone-number';
  static const String phoneNumberVerfication = 'phone-number-verfication';
}

class AuthCoordinator {
  static const autoRoute = CustomRoute(
    path: XRoutes.auth,
    name: "AuthRouter",
    page: AuthWrapperView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 750,
    children: [
      AutoRoute(path: AuthRouters.signIn, page: SignInView, initial: true),
      AutoRoute(path: AuthRouters.signUp, page: SignUpView),
      AutoRoute(path: AuthRouters.forgotPassword, page: ForgotPasswordView),
      AutoRoute(path: AuthRouters.newPassword, page: NewPasswordView),
      AutoRoute(
          path: AuthRouters.signWithPhoneNumber,
          page: SignInWithPhoneNumberView),
    ],
  );
}
