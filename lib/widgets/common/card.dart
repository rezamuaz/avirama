import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

class XCard extends StatelessWidget {
  const XCard({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.blurRadius,
    this.padding,
    this.margin,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final double? blurRadius;
  final BorderRadiusGeometry? borderRadius;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(Constants.kPaddingM),
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? BorderRadius.circular(Constants.kPaddingL),
        color: const Color(0xFFFFFFFF),
        // add shadow
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEDEDED),
            offset: const Offset(0, 0),
            blurRadius: blurRadius ?? 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
