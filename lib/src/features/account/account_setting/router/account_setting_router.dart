import 'package:auto_route/auto_route.dart';

import '../../../../middleware/auth_guards.dart';
import '../../../../router/router_name.dart';
import '../view/change_password_view.dart';
import '../view/connected_social_account_view.dart';
import '../view/update_email_view.dart';
import '../view/update_personal_infomation_view.dart';
import '../view/update_phone_number_view.dart';
import '../view/update_profile_view.dart';
import 'account_setting_wrapper.dart';

class AccountSettingRouters {
  static const String changePassword = 'change-password';
  static const String updateProfile = 'update-profile';
  static const String updatePhoneNumber = 'update-phone-number';
  static const String updateEmail = 'update-email';
  static const String updatePersonalInformation = 'update-persona-information';

  static const String connectedSocialAccount = 'connected-social-account';
}

class AccountSettingCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.accountSetting,
    name: "AccountSettingRouter",
    page: AccountSettingWrapperView,
    guards: [AuthGuard],
    children: [
      AutoRoute(
        path: AccountSettingRouters.changePassword,
        page: ChangePasswordView,
      ),
      AutoRoute(
        path: AccountSettingRouters.updateProfile,
        page: UpdateProfileView,
      ),
      AutoRoute(
        path: AccountSettingRouters.updatePhoneNumber,
        page: UpdatePhoneNumberView,
      ),
      AutoRoute(
        path: AccountSettingRouters.updateEmail,
        page: UpdateEmailView,
      ),
      AutoRoute(
        path: AccountSettingRouters.connectedSocialAccount,
        page: ConnectedSocialAccountView,
      ),
      AutoRoute(
        path: AccountSettingRouters.updatePersonalInformation,
        page: UpdatePersonalInformationView,
      ),
    ],
  );
}
