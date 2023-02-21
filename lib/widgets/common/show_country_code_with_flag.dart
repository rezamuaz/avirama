import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

class XShowCountryCodeWithFlag extends StatelessWidget {
  const XShowCountryCodeWithFlag({
    Key? key,
    required this.countryCode,
    this.height,
    this.width,
    this.textStyle,
  }) : super(key: key);

  final String countryCode;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  static TextStyle? defaultTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: Constants.kFontSizeS,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Flag.fromString(
        //   countryCode,
        //   borderRadius: 48,
        //   height: height ?? 48,
        //   width: width ?? 48,
        //   fit: BoxFit.cover,
        //   replacement: Container(
        //     padding: const EdgeInsets.all(Constants.kPaddingXS),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(48),
        //       color: XColors.grey_60,
        //     ),
        //     height: height ?? 48,
        //     width: width ?? 48,
        //     child: const Center(
        //       child: Text(
        //         "?",
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 8,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(width: Constants.kPaddingXS),
        Text(
          countryCode,
          style: textStyle ?? defaultTextStyle(context),
        ),
      ],
    );
  }
}
