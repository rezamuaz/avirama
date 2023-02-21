import 'package:absensi_app/src/features/home/router/homeview_wrapper_view.dart';
import 'package:auto_route/auto_route.dart';

import '../../../middleware/auth_guards.dart';
import '../../../middleware/verify_user_guards.dart';
import '../../../router/router_name.dart';
import '../../account/view/account_view.dart';
import '../view/dashboard_view.dart';

class DashboardRouters {
  static const String home = 'home';
  static const String consultation = 'consultation';
  static const String informationZone = 'information-zone';
  static const String account = 'account';
  static const String favoritedItem = 'favorited-items';
}

class SettingRouters {
  static const String selectLanguage = 'select-language';
}

class DashboardCoordinator {
  static const autoRoute = CustomRoute(
    page: DashBoardView,
    name: "DashboardRouter",
    path: XRoutes.dashBoard,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 750,
    guards: [AuthGuard, VerifyUserGuard],
    children: [
      AutoRoute(
        path: DashboardRouters.home,
        name: 'HomeRouter',
        page: HomeViewWrapperView,
      ),
      AutoRoute(
        path: DashboardRouters.account,
        name: 'AccountRouter',
        page: AccountView,
        children: [
          AutoRoute(path: '', page: AccountView),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
    ],
  );
}
