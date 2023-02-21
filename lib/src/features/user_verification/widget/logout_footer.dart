import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:absensi_app/widgets/common/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dialogs/alert_wrapper.dart';
import '../../../localization/localization_utils.dart';
import '../../../router/coordinator.dart';
import '../../../router/router_name.dart';
import '../../../theme/colors.dart';
import '../../auth/logic/auth_bloc.dart';

class LogoutFooter extends StatelessWidget {
  const LogoutFooter({Key? key, this.onResult}) : super(key: key);

  final Function(bool)? onResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Constants.kPaddingXL),
        XTextDivider(text: S.text.or),
        _logoutWidget(context),
      ],
    );
  }

  Widget _logoutWidget(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _authBlocListener,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ingin beralih akun?',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          TextButton(
            onPressed: _logoutAlert,
            child: Text(
              S.text.logout,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: XAppColors.primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logoutAlert() async {
    bool result = await XAlert.onWillPop(
      S.text.common_are_you_sure_you_want_logout,
    );

    if (result) _logout();
  }

  void _logout() {
    XCoordinator.context.read<AuthBloc>().add(const AuthEvent.logout());
  }

  void _authBlocListener(BuildContext context, AuthState state) {
    state.whenOrNull(
      logouting: () => showLoading(context),
      isError: (e) {
        FlashMessage.error(context: context, error: e);
        hideLoading();
      },
      successLogout: (_) {
        XToast.show(S.text.success_logout);
        hideLoading();
        _goToSignInView();
      },
    );
  }

  // go to sign in view when logout success
  void _goToSignInView() {
    final router = XCoordinator.rootRouter;
    router.replaceNamed(XRoutes.dashBoard);
    if (isNullOrEmpty(router.current.path)) {
      router.replaceNamed(XRoutes.dashBoard);
    }
  }
}
