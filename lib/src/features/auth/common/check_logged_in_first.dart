import '../../../dialogs/alert_wrapper.dart';
import '../../../dialogs/widget/x_alert_dialog.dart';
import '../../../localization/localization_utils.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';
import '../../../services/auth_service.dart';

Future<void> checkLoggedInFirst(Function? onLoggedIn) async {
  bool isLoggedIn = Auth.instance.isLoggedIn;

  if (!isLoggedIn) {
    bool result = await alertMustLoginFirst();

    if (result) {
      await XCoordinator.rootRouter.push(
        AuthRouter(children: [
          SignInRoute(onResult: (bool success) {
            // if success == true the action will be resumed
            // else it will be  aborted
            onLoggedIn?.call();
          })
        ]),
      );
    }
  }

  if (isLoggedIn) {
    onLoggedIn?.call();
  }
}

Future<bool> alertMustLoginFirst() async {
  dynamic result = await XAlert.show(
    title: S.text.sign_in_first,
    body: S.text.sign_in_first_desc,
    actions: [
      XAlertButton(S.text.common_close, key: ""),
      XAlertButton(S.text.sign_in, key: "1"),
    ],
  );
  return result == "1";
}
