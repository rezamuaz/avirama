import 'package:auto_route/auto_route.dart';

import '../../src/router/router_name.dart';
import '../location/dev_view.dart';
import '../location/dev_wrapper_view.dart';
import '../view/dev_button_view.dart';
import '../view/dev_device_view.dart';
import '../view/dev_dialog_view.dart';
import '../view/dev_input_view.dart';
import '../view/dev_other_view.dart';
import '../view/dev_state_view.dart';
import '../view/dev_text_view.dart';
import '../view/dev_theme_view.dart';

class DevRouters {
  static const String device = 'device';
  static const String button = 'button';
  static const String theme = 'theme';
  static const String textTheme = 'textTheme';
  static const String dialog = 'dialog';
  static const String input = 'input';
  static const String state = 'state';
  static const String other = 'other';
}

class DevCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dev,
    name: "DevRouter",
    page: DevWrapperView,
    children: [
      AutoRoute(path: '', page: DevView),
      AutoRoute(path: DevRouters.device, page: DevDeviceView),
      AutoRoute(path: DevRouters.button, page: DevButtonView),
      AutoRoute(path: DevRouters.theme, page: DevThemeView),
      AutoRoute(path: DevRouters.textTheme, page: DevTextView),
      AutoRoute(path: DevRouters.dialog, page: DevDialogView),
      AutoRoute(path: DevRouters.input, page: DevInputView),
      AutoRoute(path: DevRouters.state, page: DevStateUIView),
      AutoRoute(path: DevRouters.other, page: DevOtherView),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
