import 'package:flutter/material.dart';

import '../../../localization/localization_utils.dart';
import '../../../router/coordinator.dart';
import '../../../theme/colors.dart';
import '../router/auth_router.dart';

class XDontHaveAccount extends StatelessWidget {
  const XDontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.text.dont_have_an_account,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextButton(
          onPressed: () => XCoordinator.rootRouter.pushNamed(
            AuthRouters.signUp,
          ),
          child: Text(
            S.text.join_now,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: XAppColors.primary,
                ),
          ),
        ),
      ],
    );
  }
}
