import 'package:auto_route/auto_route.dart';

import '../../../router/router_name.dart';
import '../view/user_verification_view.dart';
import 'user_verification_wrapper.dart';

class UserVerificationCoordinator {
  static const autoRoute = CustomRoute(
    path: XRoutes.userVerification,
    name: "UserVerificationRouter",
    page: UserVerificationWrapperView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 750,
    children: [
      AutoRoute(
        path: '',
        page: UserVerificationView,
        initial: true,
      ),
    ],
  );
}
