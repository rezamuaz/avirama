import 'package:flutter/material.dart';

class BoxIcon extends StatelessWidget {
  final double? boxSize;
  final Color? boxColor;
  final Widget? icon;
  const BoxIcon(
      {this.boxSize = 14,
      this.icon = const SizedBox(),
      this.boxColor = const Color.fromARGB(200, 200, 200, 200),
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxSize,
      width: boxSize,
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(boxSize! / 2)),
      child: Center(child: icon),
    );
  }
}
