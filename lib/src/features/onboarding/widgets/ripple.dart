import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class XRipple extends StatelessWidget {
  final double radius;

  const XRipple({
    Key? key,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      left: screenWidth / 2 - radius,
      bottom: 2 * Constants.kPaddingL - radius,
      child: Container(
        width: 2 * radius,
        height: 2 * radius,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: XColors.white,
        ),
      ),
    );
  }
}
