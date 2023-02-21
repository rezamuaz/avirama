import 'package:flutter/material.dart';

import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import '../../widgets/form_content_header.dart';
import 'form/change_password_form.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          S.text.password_update,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        children: [
          XFormContentHeader(
            title: S.text.new_password,
            description: S.text.create_a_strong_password,
          ),
          const ChangePasswordForm(),
        ],
      ),
    );
  }
}
