import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/forms/pin_put.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../widgets/common/bottom_sheet.dart';
import '../../../dialogs/alert_wrapper.dart';
import '../../../localization/localization_utils.dart';
import '../../../router/coordinator.dart';
import '../widgets/verification_view_wrapper.dart';

class XPhoneNumberVerficationView extends StatefulWidget {
  const XPhoneNumberVerficationView({
    Key? key,
    this.onSuccess,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;
  final Function(String)? onSuccess;

  static show({required String phoneNumber, Function(String)? onSuccess}) {
    XBottomSheet.showStyleTwo(
      XPhoneNumberVerficationView(
        phoneNumber: phoneNumber,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  State<XPhoneNumberVerficationView> createState() =>
      _XPhoneNumberVerficationViewState();
}

class _XPhoneNumberVerficationViewState
    extends State<XPhoneNumberVerficationView> {
  final _otpController = TextEditingController();
  final _otpValidator = ValidationBuilder().required().minLength(6).build();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isBussy = false;
  bool isCanPop = false;

  Future<bool> _onWillPop() async {
    if (isCanPop) return true;

    return XAlert.onWillPop(
      S.text
          .are_you_sure_you_want_to_cancel_the_phone_number_verification_process,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: FirebasePhoneAuthHandler(
        onLoginSuccess: _onSuccessVerifPhoneNumber,
        onLoginFailed: (FirebaseAuthException onLoginFailed, _) =>
            _onVerifOtpFailded(context, onLoginFailed),
        phoneNumber: widget.phoneNumber,
        builder: (context, controller) {
          return XVerficationViewWrapper(
            title: S.text.verify_phone_number,
            description: S.text.please_type_otp_sms(widget.phoneNumber),
            children: [
              _form(context, controller),
              const SizedBox(height: Constants.kPaddingL * 2),
              _verifyButton(controller),
            ],
            onResendCode: () => _onResendCode(controller),
          );
        },
      ),
    );
  }

  Form _form(BuildContext context, FirebasePhoneAuthController controller) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          XPintPut(
            controller: _otpController,
            enabled: true,
            onSubmitted: (_) => _onButtonVerifyPress(context, controller),
            validator: _otpValidator,
          ),
        ],
      ),
    );
  }

  XButton _verifyButton(FirebasePhoneAuthController controller) {
    return XButton(
      onPressed: () => _onButtonVerifyPress(context, controller),
      busy: isBussy,
      title: S.text.verify,
    );
  }

  void _onVerifOtpFailded(BuildContext context, FirebaseAuthException e) {
    if (e.message!.contains("phone auth credential is invalid.")) {
      FlashMessage.show(
        context: context,
        message: S.text.please_enter_valid_otp,
      );
    } else {
      FlashMessage.error(context: context);
    }
  }

  Future<void> _onResendCode(FirebasePhoneAuthController controller) async {
    bool result = await controller.sendOTP();
    setState(() {
      isBussy = false;
    });
    if (result) {
      XToast.show(S.text.common_success);
    }
  }

  Future<void> _onButtonVerifyPress(
    BuildContext context,
    FirebasePhoneAuthController controller,
  ) async {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _toggleIsBussy();
      await controller.verifyOtp(_otpController.text);
      _toggleIsBussy();
    }
  }

  void _toggleIsBussy() => setState(() {
        isBussy = !isBussy;
      });

  Future<void> _onSuccessVerifPhoneNumber(
    UserCredential userCredetial,
    bool autoVerified,
  ) async {
    final String? userToken = await userCredetial.user?.getIdToken();

    if (userToken != null) {
      isCanPop = true;
      widget.onSuccess?.call(userToken);
      XCoordinator.pop(userToken);
    } else {
      FlashMessage.error(context: context);
    }
  }
}
