import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class XIndicator extends StatelessWidget {
  const XIndicator(
      {this.radius = 15, Key? key, this.valueColor, this.backgroundColor})
      : super(key: key);
  final double radius;
  final Color? valueColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isAndroid) {
      return Center(
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CircularProgressIndicator(
            valueColor: valueColor != null
                ? AlwaysStoppedAnimation<Color>(valueColor!)
                : null,
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.onBackground,
            strokeWidth: 1.5,
          ),
        ),
      );
    }
    return Center(
      child: CupertinoActivityIndicator(
        radius: radius,
      ),
    );
  }
}
