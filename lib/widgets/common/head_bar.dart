import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';

class XHeadBar extends StatelessWidget {
  const XHeadBar({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Constants.kPaddingM),
      width: 60,
      height: 4,
      decoration: BoxDecoration(
        color: color ?? XColors.grey_40,
        borderRadius: BorderRadius.circular(
          Constants.kRadiusXL,
        ),
      ),
    );
  }
}
