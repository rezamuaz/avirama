import 'dart:io';

import 'package:flutter/material.dart';

import '../../src/router/coordinator.dart';

class XBackButton extends StatelessWidget {
  const XBackButton({
    Key? key,
    this.icon,
    this.color,
    this.onPressed,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            // pop
            XCoordinator.pop();
          },
      icon: Icon(icon ?? defaultIcon()),
      color: color ?? Theme.of(context).appBarTheme.actionsIconTheme?.color,
    );
  }

  static IconData defaultIcon() {
    return Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios;
  }
}
