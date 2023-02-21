import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../localization/localization_utils.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../../router/coordinator.dart';
import '../../../../router/router_name.dart';

class XAuthSectionBody extends StatelessWidget {
  const XAuthSectionBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: const XCacheNetworkImage(
            imageUrl: Constants.defaultProfilePhotoUrl,
            size: Size(50, 50),
          ),
        ),
        const SizedBox(width: Constants.kPaddingS),
        Expanded(
          child: SizedBox(
            height: Theme.of(context).buttonTheme.height / 1.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                XButton(
                  onPressed: _goToSignInView,
                  withHorizontalPadding: false,
                  title: S.text.sign_in,
                ),
                const SizedBox(width: Constants.kPaddingS),
                XOutlinedButton(
                  onPressed: _goToSignUpView,
                  withHorizontalPadding: false,
                  child: Text(S.text.sign_up),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _goToSignInView() {
    XCoordinator.rootRouter.pushNamed(XRoutes.auth);
  }

  void _goToSignUpView() {
    XCoordinator.rootRouter.push(
      AuthRouter(
        children: [
          SignInRoute(),
          const SignUpRoute(),
        ],
      ),
    );
  }
}
