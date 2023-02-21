import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class XNextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const XNextPageButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(Constants.kPaddingM),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: XAppColors.primary,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: XColors.white,
        size: 32.0,
      ),
    );
  }
}
