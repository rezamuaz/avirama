import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class XTextColumnOnboarding extends StatelessWidget {
  const XTextColumnOnboarding({
    required Key key,
    required this.title,
    this.text,
    this.textCenter = true,
  }) : super(key: key);

  final String title;
  final String? text;
  final bool textCenter;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Constants.kCardAnimationDuration,
      child: Container(
        key: key,
        child: Column(
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: XColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: Constants.kPaddingM),
            if (text != null)
              Text(
                text!,
                textAlign: textCenter ? TextAlign.center : TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: XColors.white,
                    ),
              ),
            const SizedBox(height: Constants.kPaddingXL),
          ],
        ),
      ),
    );
  }
}
