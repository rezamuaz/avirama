import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/common/indicator.dart';
import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class XButton extends StatelessWidget {
  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool withHorizontalPadding;
  final double? width;
  final bool showLoadingWidget;
  final Color? backgroundColor;
  // final Color? textColors;

  const XButton({
    this.onPressed,
    this.title,
    this.child,
    this.busy = false,
    this.enabled = true,
    Key? key,
    this.withHorizontalPadding = true,
    this.width,
    this.showLoadingWidget = true,
    this.backgroundColor = const Color(0xff5AE25A),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
      onPressed: enabled && !busy
          ? () {
              if (onPressed != null || busy == false) {
                onPressed?.call();
              }
            }
          : null,
      child: XBusyTitle(
        busy: busy,
        width: width,
        title: title,
        withHorizontalPadding: withHorizontalPadding,
        showLoadingWidget: showLoadingWidget,
        child: child,
      ),
    );
  }
}

class XBusyTitle extends StatelessWidget {
  final bool busy;
  final String? title;
  final Widget? child;
  final bool withHorizontalPadding;
  final double? width;
  final bool showLoadingWidget;

  const XBusyTitle({
    this.title,
    this.child,
    this.busy = false,
    Key? key,
    this.withHorizontalPadding = true,
    this.width,
    this.showLoadingWidget = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 12;
    return SizedBox(
      height: Theme.of(context).buttonTheme.height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if ((!busy || !showLoadingWidget) && withHorizontalPadding)
            const SizedBox(width: padding * 2),
          if (!busy || !showLoadingWidget)
            child ??
                Text(
                  title ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
          if (busy && showLoadingWidget)
            Row(
              children: [
                XIndicator(
                  radius: 10,
                  valueColor: Colors.grey[300],
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: Constants.kPaddingS),
                const Text(
                  "Loading",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          if ((!busy || !showLoadingWidget) && withHorizontalPadding)
            const SizedBox(width: padding * 2),
        ],
      ),
    );
  }
}
