import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:flutter/material.dart';

import '../../../localization/localization_utils.dart';
import '../../../router/coordinator.dart';
import '../router/auth_router.dart';

class XSignInWithPhoneNumberButton extends StatefulWidget {
  const XSignInWithPhoneNumberButton({
    Key? key,
    this.isLoading = false,
  }) : super(key: key);

  final bool isLoading;

  @override
  State<XSignInWithPhoneNumberButton> createState() =>
      _XSignInWithPhoneNumberButtonState();
}

class _XSignInWithPhoneNumberButtonState
    extends State<XSignInWithPhoneNumberButton> {
  @override
  Widget build(BuildContext context) {
    return XOutlinedButton(
      onPressed: _onTap,
      busy: widget.isLoading,
      showLoadingWidget: false,
      withHorizontalPadding: false,
      child: Expanded(
        child: Row(
          children: [
            const SizedBox(width: Constants.kPaddingS + 4),
            const Icon(Icons.phone_android_rounded),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(S.text.sign_in_with_phone_number_title),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    XCoordinator.rootRouter.pushNamed(AuthRouters.signWithPhoneNumber);
  }
}
