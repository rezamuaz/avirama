import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/common/text_divider.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:form_validator/form_validator.dart';

import '../../../localization/localization_utils.dart';
import '../../../network/model/auth/sign_in/phone_number_request.dart';
import '../../verfication/view/phone_number_verfication_view.dart';
import '../common/expand_size.dart';
import '../logic/auth_bloc.dart';
import '../widget/custom_auth_scaffold.dart';
import '../widget/custom_country_code_picker.dart';
import '../widget/dont_have_account.dart';
import '../widget/sign_in_with_email_button.dart';
import '../widget/sign_in_with_google_button.dart';

class SignInWithPhoneNumberView extends StatefulWidget {
  const SignInWithPhoneNumberView({Key? key}) : super(key: key);

  @override
  State<SignInWithPhoneNumberView> createState() =>
      _SignInWithPhoneNumberViewState();
}

class _SignInWithPhoneNumberViewState extends State<SignInWithPhoneNumberView> {
  ErrorResponseMessage? _error;
  String dialCode = dotenv.env['DEFAULT_DIAL_CODE']!;

  final _phoneNumberController = TextEditingController();
  final _phoneNumberValidator = ValidationBuilder().required().phone().build();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _authBlocListener(BuildContext context, AuthState state) {
    state.whenOrNull(
      isError: (e) => e.whenOrNull(
        unprocessableEntity: (m) => _error = m,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      title: S.text.sign_in_with_phone_number_title,
      description: S.text.sign_in_with_phone_number_description,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: _authBlocListener,
        builder: (context, state) {
          return Column(
            children: [
              _form(context, state),
              _sendCodeButton(state),
              XTextDivider(
                text: S.text.or,
                vertical: Constants.kPaddingL,
              ),
              XSignInWithEmailButton(
                isLoading: state.maybeWhen(
                  isLoading: () => true,
                  orElse: () => false,
                ),
              ),
              const SizedBox(height: Constants.kPaddingM),
              XSignInWithGoogleButton(
                isLoading: state.maybeWhen(
                  isLoading: () => true,
                  orElse: () => false,
                ),
              ),
              const SizedBox(height: Constants.kPaddingL),
              const XDontHaveAccount(),
            ],
          );
        },
      ),
    );
  }

  Form _form(BuildContext context, AuthState state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: expandedSize(context, size: 0.1)),
          XInputCustom(
            labelText: S.text.field_phoneNumber,
            prefixIconWidget: _countryCodePicker(),
            controller: _phoneNumberController,
            errorText: _error.message("phone_number"),
            keyboardType: TextInputType.number,
            onChanged: _onInputChange,
            validator: _phoneNumberValidator,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          SizedBox(height: expandedSize(context, size: 0.1)),
        ],
      ),
    );
  }

  void _onInputChange(String? value) {
    if (value?.length == 1) {
      if (value!.substring(0, 1) == "0") {
        _phoneNumberController.text = "";
      }
    }
  }

  XCountryCodePicker _countryCodePicker() {
    return XCountryCodePicker(
      initialSelection: dialCode,
      onChange: (Country result) {
        dialCode = result.phoneCode.isEmpty
            ? dotenv.env['DEFAULT_DIAL_CODE']!
            : result.phoneCode;
      },
    );
  }

  XButton _sendCodeButton(AuthState state) {
    return XButton(
      onPressed: () => _onButtonSendCode(context),
      busy: state.maybeWhen(
        isLoading: () => true,
        orElse: () => false,
      ),
      title: S.text.send_code,
    );
  }

  Future<void> _onButtonSendCode(BuildContext context) async {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _error = null;

      await XPhoneNumberVerficationView.show(
        phoneNumber: dialCode + _phoneNumberController.text,
        onSuccess: _signIn,
      );
    }
  }

  void _signIn(String idToken) {
    context.read<AuthBloc>().add(
          AuthEvent.phoneNumber(
            PhoneNumberRequest(firebaseVerifyIdToken: idToken),
          ),
        );
  }
}
