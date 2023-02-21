import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/model/user/user.dart';
import '../../../../services/auth_service.dart';
import '../../../verfication/view/phone_number_verfication_view.dart';
import '../../widgets/form_content_header.dart';
import 'form/new_phone_number_form.dart';

class UpdatePhoneNumberView extends StatefulWidget {
  const UpdatePhoneNumberView({Key? key}) : super(key: key);

  @override
  State<UpdatePhoneNumberView> createState() => _UpdatePhoneNumberViewState();
}

class _UpdatePhoneNumberViewState extends State<UpdatePhoneNumberView> {
  late User user;
  bool verifyIdentity = false;

  @override
  void initState() {
    user = Auth.instance.user as User;
    verifyIdentity = user.phoneNumber == null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          S.text.update_phone_number,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: verifyIdentity
          ? _newPhoneNumberWidget()
          : _verifyIdentityFirstWidget(),
    );
  }

  ListView _verifyIdentityFirstWidget() {
    return ListView(
      children: [
        XFormContentHeader(
          title: S.text.verify_identity,
          description: S.text.verify_identity_desc,
        ),
        Padding(
          padding: const EdgeInsets.all(Constants.kPaddingL),
          child: XOutlinedButton(
            onPressed: _onVerifyIdentityPress,
            child: Row(
              children: [
                const Icon(Icons.phone_android_rounded),
                const SizedBox(width: Constants.kPaddingM),
                Text(S.text.verify_with_otp(S.text.sms)),
              ],
            ),
          ),
        )
        // const NewPhoneNumberForm(),
      ],
    );
  }

  ListView _newPhoneNumberWidget() {
    return ListView(
      children: [
        XFormContentHeader(
          title: S.text.new_phone_number,
          description: S.text.sign_in_with_phone_number_description,
        ),
        const NewPhoneNumberForm(),
      ],
    );
  }

  void _onVerifyIdentityPress() {
    XPhoneNumberVerficationView.show(
      phoneNumber: user.phoneNumber!,
      onSuccess: (_) {
        setState(() {
          verifyIdentity = true;
        });
      },
    );
  }
}
