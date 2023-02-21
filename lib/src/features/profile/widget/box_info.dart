import 'package:absensi_app/gen/assets.gen.dart';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/features/profile/widget/box_icon.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxInfo extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final double? titleSize;
  final FontWeight? titleBold;
  final String? content;
  final Color? contentColor;
  final double? contentSize;
  final FontWeight? contentBold;
  final Color? boxColor;
  final double? boxSized;
  final Widget? icon;

  const BoxInfo(
      {super.key,
      this.title,
      this.titleColor,
      this.titleSize,
      this.content,
      this.boxColor,
      this.boxSized,
      this.icon,
      this.titleBold,
      this.contentColor,
      this.contentSize,
      this.contentBold});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxIcon(
          boxSize: boxSized ?? Constants.kIconsL,
          icon: icon ?? Assets.svgs.moneySalary.svg(),
          boxColor: boxColor ?? const Color.fromARGB(255, 168, 60, 0),
        ),
        const SizedBox(height: Constants.kPaddingXS),
        Text(
          title ?? 't',
          style: TextStyle(
              color: titleColor ?? XColors.grey_80,
              fontSize: titleSize ?? Constants.kFontSizeS,
              fontWeight: titleBold ?? FontWeight.w600),
        ),
        const SizedBox(height: Constants.kPaddingXS),
        Text(
          content ?? '0',
          style: TextStyle(
              color: contentColor ?? XColors.grey_100,
              fontSize: contentSize ?? Constants.kFontSizeS,
              fontWeight: contentBold ?? FontWeight.w400),
        ),
      ],
    );
  }
}
