import 'package:auto_route/auto_route.dart';

import '../features/user_verification/common/verify_user_validator.dart';
import '../router/auto_router.gr.dart';

class VerifyUserGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation

    if (verifyUserValidator()) {
      resolver.next();
    } else {
      router.push(
        UserVerificationRouter(
          children: [
            UserVerificationRoute(
              onResult: (bool success) {
                // if success == true the navigation will be resumed
                // else it will be aborted
                resolver.next(success);
              },
            ),
          ],
        ),
      );
    }
  }
}
