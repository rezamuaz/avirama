import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class XIconContainer extends StatelessWidget {
  final IconData icon;
  final double padding;

  const XIconContainer({
    Key? key,
    required this.icon,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: XColors.white.withOpacity(0.25),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 32.0,
        color: XColors.white,
      ),
    );
  }
}
