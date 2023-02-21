import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/domain_manager.dart';
import '../../../../network/model/user/user.dart';
import '../../../../services/auth_service.dart';
import '../../../verfication/view/email_verification_view.dart';
import '../../widgets/form_content_header.dart';
import 'form/new_email_form.dart';

class UpdateEmailView extends StatefulWidget {
  const UpdateEmailView({Key? key}) : super(key: key);

  @override
  State<UpdateEmailView> createState() => _UpdateEmailViewState();
}

class _UpdateEmailViewState extends State<UpdateEmailView> {
  late User user;
  bool verifyIdentity = false;
  String? helperKey;

  @override
  void initState() {
    user = Auth.instance.user as User;
    verifyIdentity = user.email == null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          S.text.update_email,
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
            onPressed: () => _onVerifyIdentityPress(context),
            child: Row(
              children: [
                const Icon(Icons.email_rounded),
                const SizedBox(width: Constants.kPaddingM),
                Text(S.text.verify_with_otp(S.text.field_email)),
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
          title: S.text.new_email,
          description: S.text.new_email_desc,
        ),
        NewEmailForm(helperKey: helperKey),
      ],
    );
  }

  void _onVerifyIdentityPress(BuildContext context) {
    final repository = GetIt.I<DomainManager>().accountSettingRepository;

    EmailVerificationView.show(
      args: EmailVerificationArgs(
        onSuccess: (String helperKeyResult) {
          setState(() {
            verifyIdentity = true;
            helperKey = helperKeyResult;
          });
        },
        email: user.email!,
        onSendEmail: () {
          return repository.sendChangeEmailVerficationCode();
        },
        onVerifyOtp: (String code) {
          return repository.verifEmailVerficationKey(
            key: code,
          );
        },
      ),
    );
  }
}
