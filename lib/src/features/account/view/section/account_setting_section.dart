// import 'package:arx/config/devices/app_info.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:package_info_plus/package_info_plus.dart';

import '../../../../localization/localization_utils.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../common/setting/setting_bloc.dart';
import '../../widgets/list_section.dart';

class AccountSettingSection extends StatelessWidget {
  const AccountSettingSection({Key? key}) : super(key: key);

  // go to update personal information view
  void _goToUpdatePersonalInformationView(BuildContext context) {
    context.router.push(
      const AccountSettingRouter(
        children: [
          UpdatePersonalInformationRoute(),
        ],
      ),
    );
  }

  // go to change password view
  void _goToChangePasswordView(BuildContext context) {
    context.router.push(
      const AccountSettingRouter(
        children: [
          ChangePasswordRoute(),
        ],
      ),
    );
  }

  // go to connected social account view
  // void _goToConnectedSocialAccountView(BuildContext context) {
  //   context.router.push(
  //     AccountSettingRouter(
  //       children: [
  //         ConnectedSocialAccountRoute(),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // PackageInfo package = AppInfo.package;
    return BlocBuilder<SettingBloc, SettingState>(
        builder: (BuildContext context, state) {
      return XListSection(
        alwaysOpen: true,
        title: S.text.account_setting,
        children: [
          XSectionItem(
            onTap: () => _goToUpdatePersonalInformationView(context),
            label: S.text.about_you,
            description: S.text.update_information_about_you,
            icon: Icons.featured_play_list_outlined,
          ),
          XSectionItem(
            onTap: () => _goToChangePasswordView(context),
            label: S.text.account_security,
            description: S.text.password_pin_personal_data,
            icon: Icons.lock_outline_rounded,
          ),
          // XSectionItem(
          //   onTap: () => _goToConnectedSocialAccountView(context),
          //   label: S.text.connected_account,
          //   description: S.text.set_the_linked_account(package.appName),
          //   icon: Icons.link_sharp,
          // ),
        ],
      );
    });
  }
}
