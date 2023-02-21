import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/devices/app_info.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../gen/assets.gen.dart';
import '../../../config/constants/keys.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';
import '../../../theme/colors.dart';
import '../../auth/logic/auth_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _onRetry(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEvent.checkData());
  }

  void _authBlocListener(context, AuthState state) {
    FlutterNativeSplash.remove();
    state.maybeWhen(
      orElse: () {
        _goToView(_getInitialRoute());
      },
      isError: (_) => null,
      initial: () => null,
      isLoading: () => null,
    );
  }

  @override
  void initState() {
    super.initState();
    _onRetry(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: _authBlocListener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: XColors.white,
          body: state.maybeWhen(
            orElse: () {
              return Center(
                child: Assets.apps.biramaPng.image(width: 78),
              );
            },
            isError: (e) => _errorView(context, e),
          ),
        );
      },
    );
  }

  Widget _errorView(BuildContext context, dynamic error) {
    return ListView(
      children: [
        Assets.apps.biramaPng.image(height: 38),
        const SizedBox(height: Constants.kPaddingS),
        Text(
          AppInfo.package.appName,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: const Color(0xFF076BA2),
                fontWeight: FontWeight.normal,
              ),
          textAlign: TextAlign.center,
        ),
        StateWidget.error(
          error: error,
          onRetry: () => _onRetry(context),
        ),
      ],
    );
  }

  PageRouteInfo<dynamic> _getInitialRoute() {
    final sh = GetStorage().read(XKeys.showOnboarding);
    if (isNullOrEmpty(sh) || sh == true) {
      return const OnboardingRoute();
    } else {
      return const DashboardRouter();
    }
  }

  void _goToView(PageRouteInfo<dynamic> route) {
    XCoordinator.rootRouter.replace(route);
  }
}
