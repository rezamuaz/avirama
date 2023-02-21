// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i49;
import 'package:flutter/material.dart' as _i50;

import '../../_dev/location/dev_view.dart' as _i40;
import '../../_dev/location/dev_wrapper_view.dart' as _i12;
import '../../_dev/view/dev_button_view.dart' as _i42;
import '../../_dev/view/dev_device_view.dart' as _i41;
import '../../_dev/view/dev_dialog_view.dart' as _i45;
import '../../_dev/view/dev_input_view.dart' as _i46;
import '../../_dev/view/dev_other_view.dart' as _i48;
import '../../_dev/view/dev_state_view.dart' as _i47;
import '../../_dev/view/dev_text_view.dart' as _i44;
import '../../_dev/view/dev_theme_view.dart' as _i43;
import '../features/account/account_setting/router/account_setting_wrapper.dart'
    as _i11;
import '../features/account/account_setting/view/change_password_view.dart'
    as _i34;
import '../features/account/account_setting/view/connected_social_account_view.dart'
    as _i38;
import '../features/account/account_setting/view/update_email_view.dart'
    as _i37;
import '../features/account/account_setting/view/update_personal_infomation_view.dart'
    as _i39;
import '../features/account/account_setting/view/update_phone_number_view.dart'
    as _i36;
import '../features/account/account_setting/view/update_profile_view.dart'
    as _i35;
import '../features/account/setting/router/setting_wrapper.dart' as _i10;
import '../features/account/setting/view/select_language_view.dart' as _i33;
import '../features/account/view/account_view.dart' as _i20;
import '../features/attendance/router/attendance_wrapper_view.dart' as _i8;
import '../features/attendance/view/add_photo_before_after.dart' as _i28;
import '../features/attendance/view/add_photo_daily_view.dart' as _i27;
import '../features/attendance/view/attendance_history_view.dart' as _i31;
import '../features/attendance/view/attendance_in_done_view.dart' as _i25;
import '../features/attendance/view/attendance_in_view.dart' as _i24;
import '../features/attendance/view/attendance_out_done_view.dart' as _i30;
import '../features/attendance/view/attendance_out_view.dart' as _i29;
import '../features/attendance/view/attendance_review_view.dart' as _i26;
import '../features/attendance/view/outlet/router/outlet_router_wrapper_view.dart'
    as _i7;
import '../features/attendance/view/outlet/view/outlet_view.dart' as _i22;
import '../features/attendance/view/select_outlet_view.dart' as _i23;
import '../features/auth/router/auth_wrapper_view.dart' as _i3;
import '../features/auth/view/forgot_password_view.dart' as _i15;
import '../features/auth/view/new_password_view.dart' as _i16;
import '../features/auth/view/sign_in_view.dart.dart' as _i13;
import '../features/auth/view/sign_in_with_phone_number_view.dart' as _i17;
import '../features/auth/view/sign_up_view.dart' as _i14;
import '../features/customer/router/customer_wrapper_view.dart' as _i6;
import '../features/customer/view/customer_view.dart' as _i21;
import '../features/daily_report/router/daily_report_wrapper_view.dart' as _i9;
import '../features/daily_report/view/daily_report_view.dart' as _i32;
import '../features/dashboard/view/dashboard_view.dart' as _i5;
import '../features/home/router/homeview_wrapper_view.dart' as _i19;
import '../features/onboarding/view/onboarding_view.dart' as _i2;
import '../features/splash/view/splash_view.dart' as _i1;
import '../features/user_verification/router/user_verification_wrapper.dart'
    as _i4;
import '../features/user_verification/view/user_verification_view.dart' as _i18;
import '../middleware/auth_guards.dart' as _i51;
import '../middleware/verify_user_guards.dart' as _i52;
import '../network/model/attendance/attendance.dart' as _i54;
import '../network/model/outlet/outlet.dart' as _i53;

class XRouter extends _i49.RootStackRouter {
  XRouter({
    _i50.GlobalKey<_i50.NavigatorState>? navigatorKey,
    required this.authGuard,
    required this.verifyUserGuard,
  }) : super(navigatorKey);

  final _i51.AuthGuard authGuard;

  final _i52.VerifyUserGuard verifyUserGuard;

  @override
  final Map<String, _i49.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i49.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingView(),
        transitionsBuilder: _i49.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 750,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRouter.name: (routeData) {
      return _i49.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthWrapperView(),
        transitionsBuilder: _i49.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 750,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserVerificationRouter.name: (routeData) {
      return _i49.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.UserVerificationWrapperView(),
        transitionsBuilder: _i49.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 750,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardRouter.name: (routeData) {
      return _i49.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.DashBoardView(),
        transitionsBuilder: _i49.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 750,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomerRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CustomerWrapperView(),
      );
    },
    OutletRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.OutletWrapperView(),
      );
    },
    AttendanceRouters.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AttendanceWrapperView(),
      );
    },
    DailyReportRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DailyReportWrapperView(),
      );
    },
    SettingRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.SettingWrapperView(),
      );
    },
    AccountSettingRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AccountSettingWrapperView(),
      );
    },
    DevRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DevWrapperView(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.SignInView(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.SignUpView(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ForgotPasswordView(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.NewPasswordView(
          key: args.key,
          helperKey: args.helperKey,
        ),
      );
    },
    SignInWithPhoneNumberRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.SignInWithPhoneNumberView(),
      );
    },
    UserVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<UserVerificationRouteArgs>(
          orElse: () => const UserVerificationRouteArgs());
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.UserVerificationView(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    HomeRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.HomeViewWrapperView(),
      );
    },
    AccountRouter.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.AccountView(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.AccountView(),
      );
    },
    CustomerRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.CustomerView(),
      );
    },
    OutletRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.OutletView(),
      );
    },
    SelectOutletRoute.name: (routeData) {
      final args = routeData.argsAs<SelectOutletRouteArgs>(
          orElse: () => const SelectOutletRouteArgs());
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i23.SelectOutletView(
          key: args.key,
          onlyFavorited: args.onlyFavorited,
          initialSearch: args.initialSearch,
        ),
      );
    },
    AttendanceInRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceInRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.AttendanceInView(
          key: args.key,
          item: args.item,
        ),
      );
    },
    AttendanceDoneRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceDoneRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.AttendanceDoneView(
          key: args.key,
          item: args.item,
          path: args.path,
          lang: args.lang,
          long: args.long,
        ),
      );
    },
    AttendanceReviewRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceReviewRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.AttendanceReviewView(
          key: args.key,
          attendance: args.attendance,
        ),
      );
    },
    AddPhotoDailyRoute.name: (routeData) {
      final args = routeData.argsAs<AddPhotoDailyRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.AddPhotoDailyView(
          key: args.key,
          attendance: args.attendance,
        ),
      );
    },
    AddPhotoBeforeAfterRoute.name: (routeData) {
      final args = routeData.argsAs<AddPhotoBeforeAfterRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.AddPhotoBeforeAfterView(
          key: args.key,
          attendance: args.attendance,
        ),
      );
    },
    AttendanceOutRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceOutRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.AttendanceOutView(
          key: args.key,
          outlet: args.outlet,
        ),
      );
    },
    AttendanceOutDoneRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceOutDoneRouteArgs>();
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i30.AttendanceOutDoneView(
          key: args.key,
          item: args.item,
          path: args.path,
          lang: args.lang,
          long: args.long,
          note: args.note,
        ),
      );
    },
    AttendanceHistoryRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.AttendanceHistoryView(),
      );
    },
    DailyReportRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.DailyReportView(),
      );
    },
    SelectLanguageRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.SelectLanguageView(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i34.ChangePasswordView(),
      );
    },
    UpdateProfileRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.UpdateProfileView(),
      );
    },
    UpdatePhoneNumberRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i36.UpdatePhoneNumberView(),
      );
    },
    UpdateEmailRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.UpdateEmailView(),
      );
    },
    ConnectedSocialAccountRoute.name: (routeData) {
      final args = routeData.argsAs<ConnectedSocialAccountRouteArgs>(
          orElse: () => const ConnectedSocialAccountRouteArgs());
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i38.ConnectedSocialAccountView(
          key: args.key,
          onlyFavorited: args.onlyFavorited,
          initialSearch: args.initialSearch,
        ),
      );
    },
    UpdatePersonalInformationRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.UpdatePersonalInformationView(),
      );
    },
    DevRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i40.DevView(),
      );
    },
    DevDeviceRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i41.DevDeviceView(),
      );
    },
    DevButtonRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i42.DevButtonView(),
      );
    },
    DevThemeRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i43.DevThemeView(),
      );
    },
    DevTextRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i44.DevTextView(),
      );
    },
    DevDialogRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i45.DevDialogView(),
      );
    },
    DevInputRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i46.DevInputView(),
      );
    },
    DevStateUIRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i47.DevStateUIView(),
      );
    },
    DevOtherRoute.name: (routeData) {
      return _i49.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i48.DevOtherView(),
      );
    },
  };

  @override
  List<_i49.RouteConfig> get routes => [
        _i49.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i49.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding',
        ),
        _i49.RouteConfig(
          AuthRouter.name,
          path: '/auth',
          children: [
            _i49.RouteConfig(
              SignInRoute.name,
              path: '',
              parent: AuthRouter.name,
            ),
            _i49.RouteConfig(
              SignUpRoute.name,
              path: 'sign-up',
              parent: AuthRouter.name,
            ),
            _i49.RouteConfig(
              ForgotPasswordRoute.name,
              path: 'forgot-password',
              parent: AuthRouter.name,
            ),
            _i49.RouteConfig(
              NewPasswordRoute.name,
              path: 'new-password',
              parent: AuthRouter.name,
            ),
            _i49.RouteConfig(
              SignInWithPhoneNumberRoute.name,
              path: 'phone-number',
              parent: AuthRouter.name,
            ),
          ],
        ),
        _i49.RouteConfig(
          UserVerificationRouter.name,
          path: '/user-verification',
          children: [
            _i49.RouteConfig(
              UserVerificationRoute.name,
              path: '',
              parent: UserVerificationRouter.name,
            )
          ],
        ),
        _i49.RouteConfig(
          DashboardRouter.name,
          path: '/dashboard',
          guards: [
            authGuard,
            verifyUserGuard,
          ],
          children: [
            _i49.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: DashboardRouter.name,
            ),
            _i49.RouteConfig(
              AccountRouter.name,
              path: 'account',
              parent: DashboardRouter.name,
              children: [
                _i49.RouteConfig(
                  AccountRoute.name,
                  path: '',
                  parent: AccountRouter.name,
                ),
                _i49.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: AccountRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
          ],
        ),
        _i49.RouteConfig(
          CustomerRouter.name,
          path: 'customer',
          children: [
            _i49.RouteConfig(
              CustomerRoute.name,
              path: '',
              parent: CustomerRouter.name,
            )
          ],
        ),
        _i49.RouteConfig(
          OutletRouter.name,
          path: 'Outlet',
          children: [
            _i49.RouteConfig(
              OutletRoute.name,
              path: '',
              parent: OutletRouter.name,
            )
          ],
        ),
        _i49.RouteConfig(
          AttendanceRouters.name,
          path: '/attendances',
          children: [
            _i49.RouteConfig(
              SelectOutletRoute.name,
              path: 'select-outlet',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AttendanceInRoute.name,
              path: 'attendance-in',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AttendanceDoneRoute.name,
              path: 'attendance-done',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AttendanceReviewRoute.name,
              path: 'attendance-review',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AddPhotoDailyRoute.name,
              path: 'add-photo-daily',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AddPhotoBeforeAfterRoute.name,
              path: 'add-photo-before-after',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AttendanceOutRoute.name,
              path: 'attendance-out',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AttendanceOutDoneRoute.name,
              path: 'attendance-out',
              parent: AttendanceRouters.name,
            ),
            _i49.RouteConfig(
              AttendanceHistoryRoute.name,
              path: 'attendance-history',
              parent: AttendanceRouters.name,
            ),
          ],
        ),
        _i49.RouteConfig(
          DailyReportRouter.name,
          path: 'DailyReport',
          children: [
            _i49.RouteConfig(
              DailyReportRoute.name,
              path: '',
              parent: DailyReportRouter.name,
            )
          ],
        ),
        _i49.RouteConfig(
          SettingRouter.name,
          path: '/setting',
          children: [
            _i49.RouteConfig(
              '#redirect',
              path: '',
              parent: SettingRouter.name,
              redirectTo: 'select-language',
              fullMatch: true,
            ),
            _i49.RouteConfig(
              SelectLanguageRoute.name,
              path: 'select-language',
              parent: SettingRouter.name,
            ),
          ],
        ),
        _i49.RouteConfig(
          AccountSettingRouter.name,
          path: '/account-setting',
          guards: [authGuard],
          children: [
            _i49.RouteConfig(
              ChangePasswordRoute.name,
              path: 'change-password',
              parent: AccountSettingRouter.name,
            ),
            _i49.RouteConfig(
              UpdateProfileRoute.name,
              path: 'update-profile',
              parent: AccountSettingRouter.name,
            ),
            _i49.RouteConfig(
              UpdatePhoneNumberRoute.name,
              path: 'update-phone-number',
              parent: AccountSettingRouter.name,
            ),
            _i49.RouteConfig(
              UpdateEmailRoute.name,
              path: 'update-email',
              parent: AccountSettingRouter.name,
            ),
            _i49.RouteConfig(
              ConnectedSocialAccountRoute.name,
              path: 'connected-social-account',
              parent: AccountSettingRouter.name,
            ),
            _i49.RouteConfig(
              UpdatePersonalInformationRoute.name,
              path: 'update-persona-information',
              parent: AccountSettingRouter.name,
            ),
          ],
        ),
        _i49.RouteConfig(
          DevRouter.name,
          path: '/dev',
          children: [
            _i49.RouteConfig(
              DevRoute.name,
              path: '',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevDeviceRoute.name,
              path: 'device',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevButtonRoute.name,
              path: 'button',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevThemeRoute.name,
              path: 'theme',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevTextRoute.name,
              path: 'textTheme',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevDialogRoute.name,
              path: 'dialog',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevInputRoute.name,
              path: 'input',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevStateUIRoute.name,
              path: 'state',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              DevOtherRoute.name,
              path: 'other',
              parent: DevRouter.name,
            ),
            _i49.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DevRouter.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i49.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i49.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingView]
class OnboardingRoute extends _i49.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.AuthWrapperView]
class AuthRouter extends _i49.PageRouteInfo<void> {
  const AuthRouter({List<_i49.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i4.UserVerificationWrapperView]
class UserVerificationRouter extends _i49.PageRouteInfo<void> {
  const UserVerificationRouter({List<_i49.PageRouteInfo>? children})
      : super(
          UserVerificationRouter.name,
          path: '/user-verification',
          initialChildren: children,
        );

  static const String name = 'UserVerificationRouter';
}

/// generated route for
/// [_i5.DashBoardView]
class DashboardRouter extends _i49.PageRouteInfo<void> {
  const DashboardRouter({List<_i49.PageRouteInfo>? children})
      : super(
          DashboardRouter.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRouter';
}

/// generated route for
/// [_i6.CustomerWrapperView]
class CustomerRouter extends _i49.PageRouteInfo<void> {
  const CustomerRouter({List<_i49.PageRouteInfo>? children})
      : super(
          CustomerRouter.name,
          path: 'customer',
          initialChildren: children,
        );

  static const String name = 'CustomerRouter';
}

/// generated route for
/// [_i7.OutletWrapperView]
class OutletRouter extends _i49.PageRouteInfo<void> {
  const OutletRouter({List<_i49.PageRouteInfo>? children})
      : super(
          OutletRouter.name,
          path: 'Outlet',
          initialChildren: children,
        );

  static const String name = 'OutletRouter';
}

/// generated route for
/// [_i8.AttendanceWrapperView]
class AttendanceRouters extends _i49.PageRouteInfo<void> {
  const AttendanceRouters({List<_i49.PageRouteInfo>? children})
      : super(
          AttendanceRouters.name,
          path: '/attendances',
          initialChildren: children,
        );

  static const String name = 'AttendanceRouters';
}

/// generated route for
/// [_i9.DailyReportWrapperView]
class DailyReportRouter extends _i49.PageRouteInfo<void> {
  const DailyReportRouter({List<_i49.PageRouteInfo>? children})
      : super(
          DailyReportRouter.name,
          path: 'DailyReport',
          initialChildren: children,
        );

  static const String name = 'DailyReportRouter';
}

/// generated route for
/// [_i10.SettingWrapperView]
class SettingRouter extends _i49.PageRouteInfo<void> {
  const SettingRouter({List<_i49.PageRouteInfo>? children})
      : super(
          SettingRouter.name,
          path: '/setting',
          initialChildren: children,
        );

  static const String name = 'SettingRouter';
}

/// generated route for
/// [_i11.AccountSettingWrapperView]
class AccountSettingRouter extends _i49.PageRouteInfo<void> {
  const AccountSettingRouter({List<_i49.PageRouteInfo>? children})
      : super(
          AccountSettingRouter.name,
          path: '/account-setting',
          initialChildren: children,
        );

  static const String name = 'AccountSettingRouter';
}

/// generated route for
/// [_i12.DevWrapperView]
class DevRouter extends _i49.PageRouteInfo<void> {
  const DevRouter({List<_i49.PageRouteInfo>? children})
      : super(
          DevRouter.name,
          path: '/dev',
          initialChildren: children,
        );

  static const String name = 'DevRouter';
}

/// generated route for
/// [_i13.SignInView]
class SignInRoute extends _i49.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i50.Key? key,
    dynamic Function(bool)? onResult,
  }) : super(
          SignInRoute.name,
          path: '',
          args: SignInRouteArgs(
            key: key,
            onResult: onResult,
          ),
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    this.onResult,
  });

  final _i50.Key? key;

  final dynamic Function(bool)? onResult;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i14.SignUpView]
class SignUpRoute extends _i49.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: 'sign-up',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i15.ForgotPasswordView]
class ForgotPasswordRoute extends _i49.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: 'forgot-password',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i16.NewPasswordView]
class NewPasswordRoute extends _i49.PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    _i50.Key? key,
    required String helperKey,
  }) : super(
          NewPasswordRoute.name,
          path: 'new-password',
          args: NewPasswordRouteArgs(
            key: key,
            helperKey: helperKey,
          ),
        );

  static const String name = 'NewPasswordRoute';
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.helperKey,
  });

  final _i50.Key? key;

  final String helperKey;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, helperKey: $helperKey}';
  }
}

/// generated route for
/// [_i17.SignInWithPhoneNumberView]
class SignInWithPhoneNumberRoute extends _i49.PageRouteInfo<void> {
  const SignInWithPhoneNumberRoute()
      : super(
          SignInWithPhoneNumberRoute.name,
          path: 'phone-number',
        );

  static const String name = 'SignInWithPhoneNumberRoute';
}

/// generated route for
/// [_i18.UserVerificationView]
class UserVerificationRoute
    extends _i49.PageRouteInfo<UserVerificationRouteArgs> {
  UserVerificationRoute({
    _i50.Key? key,
    dynamic Function(bool)? onResult,
  }) : super(
          UserVerificationRoute.name,
          path: '',
          args: UserVerificationRouteArgs(
            key: key,
            onResult: onResult,
          ),
        );

  static const String name = 'UserVerificationRoute';
}

class UserVerificationRouteArgs {
  const UserVerificationRouteArgs({
    this.key,
    this.onResult,
  });

  final _i50.Key? key;

  final dynamic Function(bool)? onResult;

  @override
  String toString() {
    return 'UserVerificationRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i19.HomeViewWrapperView]
class HomeRouter extends _i49.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: 'home',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i20.AccountView]
class AccountRouter extends _i49.PageRouteInfo<void> {
  const AccountRouter({List<_i49.PageRouteInfo>? children})
      : super(
          AccountRouter.name,
          path: 'account',
          initialChildren: children,
        );

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i20.AccountView]
class AccountRoute extends _i49.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: '',
        );

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i21.CustomerView]
class CustomerRoute extends _i49.PageRouteInfo<void> {
  const CustomerRoute()
      : super(
          CustomerRoute.name,
          path: '',
        );

  static const String name = 'CustomerRoute';
}

/// generated route for
/// [_i22.OutletView]
class OutletRoute extends _i49.PageRouteInfo<void> {
  const OutletRoute()
      : super(
          OutletRoute.name,
          path: '',
        );

  static const String name = 'OutletRoute';
}

/// generated route for
/// [_i23.SelectOutletView]
class SelectOutletRoute extends _i49.PageRouteInfo<SelectOutletRouteArgs> {
  SelectOutletRoute({
    _i50.Key? key,
    bool? onlyFavorited,
    String? initialSearch,
  }) : super(
          SelectOutletRoute.name,
          path: 'select-outlet',
          args: SelectOutletRouteArgs(
            key: key,
            onlyFavorited: onlyFavorited,
            initialSearch: initialSearch,
          ),
        );

  static const String name = 'SelectOutletRoute';
}

class SelectOutletRouteArgs {
  const SelectOutletRouteArgs({
    this.key,
    this.onlyFavorited,
    this.initialSearch,
  });

  final _i50.Key? key;

  final bool? onlyFavorited;

  final String? initialSearch;

  @override
  String toString() {
    return 'SelectOutletRouteArgs{key: $key, onlyFavorited: $onlyFavorited, initialSearch: $initialSearch}';
  }
}

/// generated route for
/// [_i24.AttendanceInView]
class AttendanceInRoute extends _i49.PageRouteInfo<AttendanceInRouteArgs> {
  AttendanceInRoute({
    _i50.Key? key,
    required _i53.SelectOutlet item,
  }) : super(
          AttendanceInRoute.name,
          path: 'attendance-in',
          args: AttendanceInRouteArgs(
            key: key,
            item: item,
          ),
        );

  static const String name = 'AttendanceInRoute';
}

class AttendanceInRouteArgs {
  const AttendanceInRouteArgs({
    this.key,
    required this.item,
  });

  final _i50.Key? key;

  final _i53.SelectOutlet item;

  @override
  String toString() {
    return 'AttendanceInRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i25.AttendanceDoneView]
class AttendanceDoneRoute extends _i49.PageRouteInfo<AttendanceDoneRouteArgs> {
  AttendanceDoneRoute({
    _i50.Key? key,
    required _i53.SelectOutlet item,
    required String path,
    required String lang,
    required String long,
  }) : super(
          AttendanceDoneRoute.name,
          path: 'attendance-done',
          args: AttendanceDoneRouteArgs(
            key: key,
            item: item,
            path: path,
            lang: lang,
            long: long,
          ),
        );

  static const String name = 'AttendanceDoneRoute';
}

class AttendanceDoneRouteArgs {
  const AttendanceDoneRouteArgs({
    this.key,
    required this.item,
    required this.path,
    required this.lang,
    required this.long,
  });

  final _i50.Key? key;

  final _i53.SelectOutlet item;

  final String path;

  final String lang;

  final String long;

  @override
  String toString() {
    return 'AttendanceDoneRouteArgs{key: $key, item: $item, path: $path, lang: $lang, long: $long}';
  }
}

/// generated route for
/// [_i26.AttendanceReviewView]
class AttendanceReviewRoute
    extends _i49.PageRouteInfo<AttendanceReviewRouteArgs> {
  AttendanceReviewRoute({
    _i50.Key? key,
    required _i54.Attendance attendance,
  }) : super(
          AttendanceReviewRoute.name,
          path: 'attendance-review',
          args: AttendanceReviewRouteArgs(
            key: key,
            attendance: attendance,
          ),
        );

  static const String name = 'AttendanceReviewRoute';
}

class AttendanceReviewRouteArgs {
  const AttendanceReviewRouteArgs({
    this.key,
    required this.attendance,
  });

  final _i50.Key? key;

  final _i54.Attendance attendance;

  @override
  String toString() {
    return 'AttendanceReviewRouteArgs{key: $key, attendance: $attendance}';
  }
}

/// generated route for
/// [_i27.AddPhotoDailyView]
class AddPhotoDailyRoute extends _i49.PageRouteInfo<AddPhotoDailyRouteArgs> {
  AddPhotoDailyRoute({
    _i50.Key? key,
    required _i54.Attendance attendance,
  }) : super(
          AddPhotoDailyRoute.name,
          path: 'add-photo-daily',
          args: AddPhotoDailyRouteArgs(
            key: key,
            attendance: attendance,
          ),
        );

  static const String name = 'AddPhotoDailyRoute';
}

class AddPhotoDailyRouteArgs {
  const AddPhotoDailyRouteArgs({
    this.key,
    required this.attendance,
  });

  final _i50.Key? key;

  final _i54.Attendance attendance;

  @override
  String toString() {
    return 'AddPhotoDailyRouteArgs{key: $key, attendance: $attendance}';
  }
}

/// generated route for
/// [_i28.AddPhotoBeforeAfterView]
class AddPhotoBeforeAfterRoute
    extends _i49.PageRouteInfo<AddPhotoBeforeAfterRouteArgs> {
  AddPhotoBeforeAfterRoute({
    _i50.Key? key,
    required _i54.Attendance attendance,
  }) : super(
          AddPhotoBeforeAfterRoute.name,
          path: 'add-photo-before-after',
          args: AddPhotoBeforeAfterRouteArgs(
            key: key,
            attendance: attendance,
          ),
        );

  static const String name = 'AddPhotoBeforeAfterRoute';
}

class AddPhotoBeforeAfterRouteArgs {
  const AddPhotoBeforeAfterRouteArgs({
    this.key,
    required this.attendance,
  });

  final _i50.Key? key;

  final _i54.Attendance attendance;

  @override
  String toString() {
    return 'AddPhotoBeforeAfterRouteArgs{key: $key, attendance: $attendance}';
  }
}

/// generated route for
/// [_i29.AttendanceOutView]
class AttendanceOutRoute extends _i49.PageRouteInfo<AttendanceOutRouteArgs> {
  AttendanceOutRoute({
    _i50.Key? key,
    required _i53.Outlet outlet,
  }) : super(
          AttendanceOutRoute.name,
          path: 'attendance-out',
          args: AttendanceOutRouteArgs(
            key: key,
            outlet: outlet,
          ),
        );

  static const String name = 'AttendanceOutRoute';
}

class AttendanceOutRouteArgs {
  const AttendanceOutRouteArgs({
    this.key,
    required this.outlet,
  });

  final _i50.Key? key;

  final _i53.Outlet outlet;

  @override
  String toString() {
    return 'AttendanceOutRouteArgs{key: $key, outlet: $outlet}';
  }
}

/// generated route for
/// [_i30.AttendanceOutDoneView]
class AttendanceOutDoneRoute
    extends _i49.PageRouteInfo<AttendanceOutDoneRouteArgs> {
  AttendanceOutDoneRoute({
    _i50.Key? key,
    required _i53.Outlet item,
    required String path,
    required String lang,
    required String long,
    required String note,
  }) : super(
          AttendanceOutDoneRoute.name,
          path: 'attendance-out',
          args: AttendanceOutDoneRouteArgs(
            key: key,
            item: item,
            path: path,
            lang: lang,
            long: long,
            note: note,
          ),
        );

  static const String name = 'AttendanceOutDoneRoute';
}

class AttendanceOutDoneRouteArgs {
  const AttendanceOutDoneRouteArgs({
    this.key,
    required this.item,
    required this.path,
    required this.lang,
    required this.long,
    required this.note,
  });

  final _i50.Key? key;

  final _i53.Outlet item;

  final String path;

  final String lang;

  final String long;

  final String note;

  @override
  String toString() {
    return 'AttendanceOutDoneRouteArgs{key: $key, item: $item, path: $path, lang: $lang, long: $long, note: $note}';
  }
}

/// generated route for
/// [_i31.AttendanceHistoryView]
class AttendanceHistoryRoute extends _i49.PageRouteInfo<void> {
  const AttendanceHistoryRoute()
      : super(
          AttendanceHistoryRoute.name,
          path: 'attendance-history',
        );

  static const String name = 'AttendanceHistoryRoute';
}

/// generated route for
/// [_i32.DailyReportView]
class DailyReportRoute extends _i49.PageRouteInfo<void> {
  const DailyReportRoute()
      : super(
          DailyReportRoute.name,
          path: '',
        );

  static const String name = 'DailyReportRoute';
}

/// generated route for
/// [_i33.SelectLanguageView]
class SelectLanguageRoute extends _i49.PageRouteInfo<void> {
  const SelectLanguageRoute()
      : super(
          SelectLanguageRoute.name,
          path: 'select-language',
        );

  static const String name = 'SelectLanguageRoute';
}

/// generated route for
/// [_i34.ChangePasswordView]
class ChangePasswordRoute extends _i49.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(
          ChangePasswordRoute.name,
          path: 'change-password',
        );

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i35.UpdateProfileView]
class UpdateProfileRoute extends _i49.PageRouteInfo<void> {
  const UpdateProfileRoute()
      : super(
          UpdateProfileRoute.name,
          path: 'update-profile',
        );

  static const String name = 'UpdateProfileRoute';
}

/// generated route for
/// [_i36.UpdatePhoneNumberView]
class UpdatePhoneNumberRoute extends _i49.PageRouteInfo<void> {
  const UpdatePhoneNumberRoute()
      : super(
          UpdatePhoneNumberRoute.name,
          path: 'update-phone-number',
        );

  static const String name = 'UpdatePhoneNumberRoute';
}

/// generated route for
/// [_i37.UpdateEmailView]
class UpdateEmailRoute extends _i49.PageRouteInfo<void> {
  const UpdateEmailRoute()
      : super(
          UpdateEmailRoute.name,
          path: 'update-email',
        );

  static const String name = 'UpdateEmailRoute';
}

/// generated route for
/// [_i38.ConnectedSocialAccountView]
class ConnectedSocialAccountRoute
    extends _i49.PageRouteInfo<ConnectedSocialAccountRouteArgs> {
  ConnectedSocialAccountRoute({
    _i50.Key? key,
    bool? onlyFavorited,
    String? initialSearch,
  }) : super(
          ConnectedSocialAccountRoute.name,
          path: 'connected-social-account',
          args: ConnectedSocialAccountRouteArgs(
            key: key,
            onlyFavorited: onlyFavorited,
            initialSearch: initialSearch,
          ),
        );

  static const String name = 'ConnectedSocialAccountRoute';
}

class ConnectedSocialAccountRouteArgs {
  const ConnectedSocialAccountRouteArgs({
    this.key,
    this.onlyFavorited,
    this.initialSearch,
  });

  final _i50.Key? key;

  final bool? onlyFavorited;

  final String? initialSearch;

  @override
  String toString() {
    return 'ConnectedSocialAccountRouteArgs{key: $key, onlyFavorited: $onlyFavorited, initialSearch: $initialSearch}';
  }
}

/// generated route for
/// [_i39.UpdatePersonalInformationView]
class UpdatePersonalInformationRoute extends _i49.PageRouteInfo<void> {
  const UpdatePersonalInformationRoute()
      : super(
          UpdatePersonalInformationRoute.name,
          path: 'update-persona-information',
        );

  static const String name = 'UpdatePersonalInformationRoute';
}

/// generated route for
/// [_i40.DevView]
class DevRoute extends _i49.PageRouteInfo<void> {
  const DevRoute()
      : super(
          DevRoute.name,
          path: '',
        );

  static const String name = 'DevRoute';
}

/// generated route for
/// [_i41.DevDeviceView]
class DevDeviceRoute extends _i49.PageRouteInfo<void> {
  const DevDeviceRoute()
      : super(
          DevDeviceRoute.name,
          path: 'device',
        );

  static const String name = 'DevDeviceRoute';
}

/// generated route for
/// [_i42.DevButtonView]
class DevButtonRoute extends _i49.PageRouteInfo<void> {
  const DevButtonRoute()
      : super(
          DevButtonRoute.name,
          path: 'button',
        );

  static const String name = 'DevButtonRoute';
}

/// generated route for
/// [_i43.DevThemeView]
class DevThemeRoute extends _i49.PageRouteInfo<void> {
  const DevThemeRoute()
      : super(
          DevThemeRoute.name,
          path: 'theme',
        );

  static const String name = 'DevThemeRoute';
}

/// generated route for
/// [_i44.DevTextView]
class DevTextRoute extends _i49.PageRouteInfo<void> {
  const DevTextRoute()
      : super(
          DevTextRoute.name,
          path: 'textTheme',
        );

  static const String name = 'DevTextRoute';
}

/// generated route for
/// [_i45.DevDialogView]
class DevDialogRoute extends _i49.PageRouteInfo<void> {
  const DevDialogRoute()
      : super(
          DevDialogRoute.name,
          path: 'dialog',
        );

  static const String name = 'DevDialogRoute';
}

/// generated route for
/// [_i46.DevInputView]
class DevInputRoute extends _i49.PageRouteInfo<void> {
  const DevInputRoute()
      : super(
          DevInputRoute.name,
          path: 'input',
        );

  static const String name = 'DevInputRoute';
}

/// generated route for
/// [_i47.DevStateUIView]
class DevStateUIRoute extends _i49.PageRouteInfo<void> {
  const DevStateUIRoute()
      : super(
          DevStateUIRoute.name,
          path: 'state',
        );

  static const String name = 'DevStateUIRoute';
}

/// generated route for
/// [_i48.DevOtherView]
class DevOtherRoute extends _i49.PageRouteInfo<void> {
  const DevOtherRoute()
      : super(
          DevOtherRoute.name,
          path: 'other',
        );

  static const String name = 'DevOtherRoute';
}
