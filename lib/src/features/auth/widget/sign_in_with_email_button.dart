import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:flutter/material.dart';

import '../../../localization/localization_utils.dart';
import '../../../router/coordinator.dart';

class XSignInWithEmailButton extends StatefulWidget {
  const XSignInWithEmailButton({
    Key? key,
    this.isLoading = false,
  }) : super(key: key);

  final bool isLoading;

  @override
  State<XSignInWithEmailButton> createState() => _XSignInWithEmailButtonState();
}

class _XSignInWithEmailButtonState extends State<XSignInWithEmailButton> {
  @override
  Widget build(BuildContext context) {
    return XOutlinedButton(
      onPressed: _onTap,
      busy: widget.isLoading,
      showLoadingWidget: false,
      child: Row(
        children: [
          const Icon(Icons.email_rounded),
          const SizedBox(width: Constants.kPaddingM),
          Text(S.text.sign_in_with_credentials),
        ],
      ),
    );
  }

  void _onTap() {
    XCoordinator.rootRouter.navigateBack();
  }
}
