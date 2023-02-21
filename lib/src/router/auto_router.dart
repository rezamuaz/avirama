import 'package:auto_route/auto_route.dart';
import '../../_dev/router/dev_router.dart';
import '../features/account/account_setting/router/account_setting_router.dart';
import '../features/account/setting/router/setting_router.dart';
import '../features/attendance/router/attendance_router.dart';
import '../features/auth/router/auth_router.dart';
import '../features/customer/router/customer_router.dart';
import '../features/daily_report/router/daily_report_router.dart';
import '../features/dashboard/router/dashboard_router.dart';
import '../features/onboarding/view/onboarding_view.dart';
import '../features/attendance/view/outlet/router/outlet_router.dart';
import '../features/splash/view/splash_view.dart';
import '../features/user_verification/router/user_verification_router.dart';
import 'router_name.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashView,
      initial: true,
    ),
    CustomRoute(
      path: XRoutes.onboarding,
      page: OnboardingView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 750,
    ),
    AuthCoordinator.autoRoute,
    UserVerificationCoordinator.autoRoute,
    DashboardCoordinator.autoRoute,
    CustomerCoordinator.autoRoute,
    OutletCoordinator.autoRoute,
    AttendanceCoordinator.autoRoute,
    DailyReportCoordinator.autoRoute,
    SettingCoordinator.autoRoute,
    AccountSettingCoordinator.autoRoute,
    DevCoordinator.autoRoute,
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
