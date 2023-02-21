import 'package:flutter/material.dart';

import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import 'form/update_personal_information_form.dart';

class UpdatePersonalInformationView extends StatefulWidget {
  const UpdatePersonalInformationView({Key? key}) : super(key: key);

  @override
  State<UpdatePersonalInformationView> createState() =>
      _UpdatePersonalInformationViewState();
}

class _UpdatePersonalInformationViewState
    extends State<UpdatePersonalInformationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          S.text.about_you,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        children: const [
          UpdatePersonalInformationForm(),
        ],
      ),
    );
  }
}
