import 'package:absensi_app/src/config/devices/app_info.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../localization/localization_utils.dart';
import '../../../../utils/x_lauch_url.dart';
import '../../../common/setting/setting_bloc.dart';
import '../../widgets/list_section.dart';

class AboutAppSection extends StatelessWidget {
  const AboutAppSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PackageInfo package = AppInfo.package;

    return BlocBuilder<SettingBloc, SettingState>(
        builder: (BuildContext context, state) {
      return XListSection(
        title: S.text.about_with_description(package.appName),
        alwaysOpen: true,
        children: [
          XSectionItem(
            onTap: () => XToast.show('#'),
            label: S.text.get_to_know_with_description(package.appName),
            icon: Icons.phone_android_rounded,
          ),
          XSectionItem(
            onTap: () => XToast.show('#'),
            label: S.text.privacy_policy,
            icon: Icons.shield_outlined,
          ),
          XSectionItem(
            onTap: () => XToast.show('#'),
            label: S.text.terms_and_conditions,
            icon: Icons.my_library_books_outlined,
          ),
          XSectionItem(
            onTap: () => XToast.show('#'),
            label: S.text.intellectual_property,
            icon: Icons.shield_outlined,
          ),
          XSectionItem(
            onTap: () {
              xlaunchUrl(dotenv.env['CS_URL']);
            },
            label: "Hubungi CS",
            icon: Icons.support_agent_rounded,
          ),
          XSectionItem(
            onTap: _inAppReview,
            label: S.text.review_this_app,
            icon: Icons.rate_review_outlined,
          ),
        ],
      );
    });
  }

  // review app
  Future<void> _inAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
