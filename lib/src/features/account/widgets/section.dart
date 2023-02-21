import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class XSection extends StatelessWidget {
  const XSection({Key? key, this.child, this.onTap}) : super(key: key);

  final Widget? child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.kPaddingXS),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: XColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.kPaddingL,
              vertical: Constants.kPaddingM,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
