import 'package:flutter/material.dart';

import '../../../localization/localization_utils.dart';
import '../../../theme/colors.dart';

class XHeader extends StatelessWidget {
  const XHeader({Key? key, required this.onSkip}) : super(key: key);

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onSkip,
          child: Text(
            S.text.common_skip,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: XColors.grey_20,
                ),
          ),
        ),
      ],
    );
  }
}
