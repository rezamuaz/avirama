import 'package:auto_route/auto_route.dart';

import '../../../../router/router_name.dart';
import '../view/select_language_view.dart';
import 'setting_wrapper.dart';

class SettingRouters {
  static const String selectLanguage = 'select-language';
}

class SettingCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.setting,
    name: "SettingRouter",
    page: SettingWrapperView,
    children: [
      AutoRoute(
        path: SettingRouters.selectLanguage,
        page: SelectLanguageView,
        initial: true,
      ),
    ],
  );
}
