import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class XOutlinedButton extends StatelessWidget {
  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool withHorizontalPadding;
  final bool withBackgroundColor;
  final double? width;
  final bool showLoadingWidget;

  const XOutlinedButton({
    this.onPressed,
    this.title,
    this.child,
    this.busy = false,
    this.enabled = true,
    Key? key,
    this.withHorizontalPadding = true,
    this.withBackgroundColor = false,
    this.width,
    this.showLoadingWidget = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: busy
          ? OutlinedButton.styleFrom(
              side: const BorderSide(color: XColors.grey_40),
            )
          : withBackgroundColor
              ? OutlinedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.15),
                )
              : null,
      onPressed: enabled && !busy
          ? () {
              if (onPressed != null || busy == false) {
                onPressed?.call();
              }
            }
          : null,
      child: XBusyTitle(
        width: width,
        busy: busy,
        title: title,
        showLoadingWidget: showLoadingWidget,
        withHorizontalPadding: withHorizontalPadding,
        child: child,
      ),
    );
  }
}
