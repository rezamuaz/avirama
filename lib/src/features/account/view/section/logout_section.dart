import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/devices/app_info.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../dialogs/alert_wrapper.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../../router/coordinator.dart';
import '../../../../router/router_name.dart';
import '../../../../services/auth_service.dart';
import '../../../../theme/colors.dart';
import '../../../auth/logic/auth_bloc.dart';
import '../../widgets/section.dart';

class LogoutSection extends StatefulWidget {
  const LogoutSection({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoutSection> createState() => _LogoutSectionState();
}

class _LogoutSectionState extends State<LogoutSection> {
  late bool isLoggedIn;

  @override
  void initState() {
    isLoggedIn = Auth.instance.isLoggedIn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PackageInfo package = AppInfo.package;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: _authBlocListener,
      builder: (context, state) {
        return XSection(
          onTap: () => _onTap(state),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      state.maybeWhen(
                        orElse: () => Icons.login,
                        loggedIn: (_) => Icons.logout,
                      ),
                      color: Colors.black54,
                    ),
                    const SizedBox(width: Constants.kPaddingS),
                    Text(
                      state.maybeWhen(
                        orElse: () => S.text.sign_in,
                        loggedIn: (_) => S.text.logout,
                      ),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                S.text.common_version(
                  "${package.version} +${package.buildNumber}",
                ),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: XColors.grey_60,
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }

  _onTap(AuthState state) {
    state.maybeWhen(
      orElse: () => _goToSignInView(),
      loggedIn: (_) => _logoutAlert(),
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
      successLogout: (_) async {
        XToast.show(S.text.success_logout);
        await XCoordinator.rootRouter.replaceAll([const SplashRoute()]);
        await Future.delayed(const Duration(seconds: 1));
        hideLoading();
      },
    );
  }

  void _goToSignInView() {
    XCoordinator.rootRouter.pushNamed(XRoutes.auth);
  }
}
