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
import 'package:unique_identifier/unique_identifier.dart';

import '../../../localization/localization_utils.dart';
import '../../../network/model/auth/sign_up/sign_up.dart';
import '../../../router/coordinator.dart';
import '../../../theme/colors.dart';
import '../../verfication/view/phone_number_verfication_view.dart';
import '../common/expand_size.dart';
import '../logic/auth_bloc.dart';
import '../widget/custom_auth_scaffold.dart';
import '../widget/custom_country_code_picker.dart';
// import '../widget/sign_in_with_google_button.dart';
// import '../widget/sign_in_with_phone_number_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ErrorResponseMessage? _error;

  String dialCode = dotenv.env['DEFAULT_DIAL_CODE']!;

  final _emailController = TextEditingController();
  final _emailValidator = ValidationBuilder().required().email().build();
  final _nameController = TextEditingController();
  final _nameValidator = ValidationBuilder().required().minLength(4).build();
  final _passwordController = TextEditingController();
  final _passwordValidator =
      ValidationBuilder().required().minLength(8).build();

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
      title: S.text.create_an_account,
      description: S.text.please_type_full_information_bellow,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: _authBlocListener,
        builder: (context, state) {
          return Column(
            children: [
              _form(context, state),
              _signUpButton(state),
              XTextDivider(
                text: S.text.or,
                vertical: Constants.kPaddingL,
              ),
              // XSignInWithGoogleButton(
              //   isLoading: state.maybeWhen(
              //     isLoading: () => true,
              //     orElse: () => false,
              //   ),
              // ),
              // const SizedBox(height: Constants.kPaddingM),
              // XSignInWithPhoneNumberButton(
              //   isLoading: state.maybeWhen(
              //     isLoading: () => true,
              //     orElse: () => false,
              //   ),
              // ),
              // const SizedBox(height: Constants.kPaddingL),
              _alreadyHaveAnAccount(context),
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
          SizedBox(height: expandedSize(context)),
          XInputCustom(
            labelText: S.text.field_name,
            prefixIcon: Icons.person,
            controller: _nameController,
            errorText: _error.message("name"),
            validator: _nameValidator,
            textInputAction: TextInputAction.next,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          const SizedBox(
            height: Constants.kPaddingL,
          ),
          XInputCustom(
            labelText: S.text.field_email,
            prefixIcon: Icons.email,
            controller: _emailController,
            errorText: _error.message("email"),
            keyboardType: TextInputType.emailAddress,
            validator: _emailValidator,
            textInputAction: TextInputAction.next,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          const SizedBox(
            height: Constants.kPaddingL,
          ),
          XInputCustom(
            labelText: S.text.field_phoneNumber,
            prefixIconWidget: _countryCodePicker(),
            controller: _phoneNumberController,
            errorText: _error.message("firebase_verify_id_token"),
            keyboardType: TextInputType.number,
            onChanged: _onInputChange,
            validator: _phoneNumberValidator,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          const SizedBox(
            height: Constants.kPaddingL,
          ),
          XInputCustom(
            labelText: S.text.field_password,
            prefixIcon: Icons.password_rounded,
            controller: _passwordController,
            errorText: _error.message("password"),
            keyboardType: TextInputType.visiblePassword,
            validator: _passwordValidator,
            obscureText: true,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          SizedBox(height: expandedSize(context)),
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
        dialCode = result.countryCode.isEmpty
            ? dotenv.env['DEFAULT_DIAL_CODE']!
            : result.countryCode;
      },
    );
  }

  XButton _signUpButton(AuthState state) {
    return XButton(
      onPressed: () => _onButtonSignUpPress(context),
      busy: state.maybeWhen(
        isLoading: () => true,
        orElse: () => false,
      ),
      title: S.text.join_now,
    );
  }

  Row _alreadyHaveAnAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.text.already_have_an_account,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextButton(
          onPressed: () => XCoordinator.rootRouter.navigateBack(),
          child: Text(
            S.text.sign_in,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: XAppColors.primary,
                ),
          ),
        ),
      ],
    );
  }

  void _onButtonSignUpPress(BuildContext context) {
    UniqueIdentifier.serial.then((value) {
      hideKeyboard(context);
      if (_formKey.currentState!.validate()) {
        _error = null;

        XPhoneNumberVerficationView.show(
          phoneNumber: dialCode + _phoneNumberController.text,
          onSuccess: (_) {
            final requests = SignUp(
                name: _nameController.text,
                email: _emailController.text,
                password: _passwordController.text,
                phoneNumber: dialCode + _phoneNumberController.text,
                imei: value ?? '');

            print('valuenya');
            print(value);

            context.read<AuthBloc>().add(
                  AuthEvent.signUp(requests),
                );
          },
        );
      }
    });
  }
}
