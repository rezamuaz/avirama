import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/common/text_divider.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/common/back_button.dart';
import '../../../localization/localization_utils.dart';
import '../../../theme/colors.dart';
import 'send_otp_again.dart';

class XVerficationViewWrapper extends StatelessWidget {
  const XVerficationViewWrapper({
    Key? key,
    required this.title,
    this.description,
    this.children,
    this.onResendCode,
    this.child,
  }) : super(key: key);

  final String title;
  final String? description;
  final Widget? child;
  final List<Widget>? children;
  final Function()? onResendCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kPaddingL,
              ),
              child: child ??
                  ListView(
                    children: [
                      const SizedBox(height: Constants.kPaddingL),
                      if (description != null) _description(context),
                      const SizedBox(height: Constants.kPaddingXL),
                      ...children!,
                      XTextDivider(
                        text: S.text.or,
                        vertical: Constants.kPaddingL,
                      ),
                      XSendOtpAgain(
                        onTap: onResendCode,
                      )
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: const SizedBox(),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      actions: const [
        XBackButton(icon: Icons.close_rounded),
      ],
    );
  }

  Padding _description(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Text(
        description!,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: XColors.grey_80,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
