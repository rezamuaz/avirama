import 'package:flutter/material.dart';

import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import 'form/update_profile_form.dart';
import 'form/update_profile_photo_form.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          S.text.update_profile,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        children: const [
          UpdateProfilePhotoForm(),
          UpdateProfileForm(),
        ],
      ),
    );
  }
}
