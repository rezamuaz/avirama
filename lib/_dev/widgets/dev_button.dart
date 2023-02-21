import 'package:flutter/material.dart';

import '../../src/router/coordinator.dart';

int _tapCount = 0;

class DevWrapButton extends StatelessWidget {
  const DevWrapButton({this.child, Key? key}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _tapCount++;
        if (_tapCount > 5) {
          _tapCount = 0;
          XCoordinator.showDev();
        }
      },
      child: Container(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
