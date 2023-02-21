import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/constants/screen.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';

class XShimmerListViewContainer extends StatelessWidget {
  const XShimmerListViewContainer({
    Key? key,
    required this.height,
    this.listViewHeight,
    this.itemCount,
    this.radius,
    this.maxWidth,
    this.children,
    this.scrollDirection = Axis.horizontal,
    this.padding,
    this.itemDirection,
    this.crossAxisAlignment,
    this.times = 4,
  }) : super(key: key);

  final double height;
  final double? listViewHeight;
  final int? itemCount;
  final double? radius;
  final double? maxWidth;
  final List<Widget>? children;
  final Axis scrollDirection;
  final Axis? itemDirection;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final int times;

  @override
  Widget build(BuildContext context) {
    final double x =
        XScreens.width - (Constants.kPaddingL * 2 + Constants.kPaddingS);

    final List<Widget> childs = [
      XShimmerContainer(
        radius: radius ?? Constants.kRadiusL,
        height: height,
        width: x < (maxWidth ?? height) ? x : maxWidth,
      )
    ];

    childs.addAll(children ?? []);

    return SizedBox(
      height: listViewHeight ?? height,
      child: ListView.builder(
        padding: padding ?? const EdgeInsets.only(),
        scrollDirection: scrollDirection,
        itemCount: itemCount ?? 3,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              right: (scrollDirection == Axis.horizontal)
                  ? Constants.kPaddingS
                  : 0,
              bottom:
                  (scrollDirection == Axis.vertical) ? Constants.kPaddingS : 0,
            ),
            child: itemDirection == Axis.horizontal
                ? Row(
                    crossAxisAlignment:
                        crossAxisAlignment ?? CrossAxisAlignment.center,
                    children: childs,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: childs,
                  ),
          );
        },
      ),
    );
  }
}

class XShimmerContainer extends StatelessWidget {
  const XShimmerContainer({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.borderRadius,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: XColors.grey_20,
        borderRadius: borderRadius ??
            BorderRadius.circular(
              radius ?? Constants.kFontSizeS,
            ),
      ),
    );
  }
}
