import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class XFormContentHeader extends StatelessWidget {
  const XFormContentHeader({
    Key? key,
    required this.title,
    this.description,
  }) : super(key: key);

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (description != null)
            Text(
              description!,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: Constants.kFontSizeS,
                    color: XColors.grey_80,
                  ),
            ),
        ],
      ),
    );
  }
}
