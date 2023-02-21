import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class XPintPut extends StatelessWidget {
  const XPintPut({
    Key? key,
    required this.controller,
    this.enabled = true,
    this.forceErrorState = false,
    this.onSubmitted,
    this.onCompleted,
    this.errorText,
    this.validator,
  }) : super(key: key);

  final bool enabled;
  final bool forceErrorState;
  final Function(String)? onSubmitted;
  final Function(String)? onCompleted;
  final String? errorText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: XColors.grey_20,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Pinput(
      enabled: enabled,
      forceErrorState: forceErrorState,
      onSubmitted: onSubmitted,
      errorText: errorText,
      length: 6,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      onCompleted: (pin) {},
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: errorColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: validator,
    );
  }
}
