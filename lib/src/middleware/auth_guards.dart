import 'package:auto_route/auto_route.dart';

import '../router/auto_router.gr.dart';
import '../services/auth_service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (Auth.instance.isLoggedIn) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      router.push(
        AuthRouter(children: [
          SignInRoute(onResult: (bool success) {
            // if success == true the navigation will be resumed
            // else it will be aborted
            resolver.next(success);
          })
        ]),
      );
    }
  }
}
