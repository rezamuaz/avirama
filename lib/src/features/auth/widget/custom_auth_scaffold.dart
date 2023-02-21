import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/devices/app_info.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../gen/assets.gen.dart';
import '../../../config/constants/keys.dart';

class CustomAuthScaffold extends StatelessWidget {
  const CustomAuthScaffold({
    Key? key,
    required this.child,
    this.title,
    required this.description,
    this.appLogo = false,
  }) : super(key: key);

  final Widget child;
  final bool appLogo;
  final String? title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(Constants.kPaddingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isNullOrEmpty(title))
                  GestureDetector(
                    onDoubleTap: () =>
                        GetStorage().remove(XKeys.showOnboarding),
                    child: AutoSizeText(
                      title!,
                      style: Theme.of(context).textTheme.headline3,
                      maxLines: 1,
                    ),
                  ),
                if (appLogo)
                  Row(
                    children: [
                      Assets.apps.biramaPng.image(
                        height:
                            Theme.of(context).textTheme.headlineLarge?.fontSize,
                      ),
                      const SizedBox(width: Constants.kPaddingS),
                      Text(
                        AppInfo.package.appName,
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                const SizedBox(height: Constants.kPaddingXS),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                child,
              ],
            ),
          )),
        ),
      ),
    );
  }
}
