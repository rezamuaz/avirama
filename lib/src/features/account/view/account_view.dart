import 'package:flutter/material.dart';

// import '../../../../_dev/widgets/dev_float_button.dart';
import '../../../localization/localization_utils.dart';
import 'section/about_app_section.dart';
import 'section/account_setting_section.dart';
// import 'section/activity_section.dart';
// import 'section/app_setting_section.dart';
import 'section/logout_section.dart';
import 'section/profile_section.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: const DevFloatButton(),
      appBar: AppBar(
        title: Text(
          S.text.my_account,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [
          ProfileSection(),
          // ActivitySection(),
          AccountSettingSection(),
          // AppSettingSection(),
          AboutAppSection(),
          LogoutSection(),
        ],
      ),
    );
  }
}
