import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';

class XTextDivider extends StatelessWidget {
  const XTextDivider(
      {Key? key,
      required this.text,
      this.left = false,
      this.vertical,
      this.horizontal})
      : super(key: key);

  final double? vertical;
  final double? horizontal;
  final String text;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: vertical ?? Constants.kPaddingM,
        horizontal: horizontal ?? 0,
      ),
      child: Row(
        children: [
          if (!left)
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                  color: XColors.grey_40,
                ),
              ),
            ),
          if (!left) const SizedBox(width: Constants.kPaddingL),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(width: Constants.kPaddingL),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: XColors.grey_40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
