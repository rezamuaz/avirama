import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/common/text_divider.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_it/get_it.dart';

import '../../../localization/localization_utils.dart';
import '../../../network/domain_manager.dart';
import '../../../network/model/auth/forgot_password/forgot_password.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';
import '../../../theme/colors.dart';
import '../../verfication/view/email_verification_view.dart';
import '../common/expand_size.dart';
import '../logic/auth_bloc.dart';
import '../widget/custom_auth_scaffold.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();
  final _emailValidator = ValidationBuilder().required().email().build();

  final _repository = GetIt.I<DomainManager>().authRepository;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSuccessCheckEmail() {
    EmailVerificationView.show(
      args: EmailVerificationArgs(
        onSuccess: (String helperKey) {
          context.router.removeLast();
          context.router.push(NewPasswordRoute(helperKey: helperKey));
        },
        email: _emailController.text,
        onSendEmail: () {
          return _repository.forgotPassword(
            forgotPassword: ForgotPassword(email: _emailController.text),
          );
        },
        onVerifyOtp: (String code) {
          return _repository.resetPasswordVerifToken(
            token: code,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      title: S.text.forgot_password_title,
      description: S.text.please_type_your_email,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(success: (_) => _onSuccessCheckEmail());
        },
        builder: (context, state) {
          return Column(
            children: [
              _buildForm(context, state),
              _sendCodeButton(state),
              XTextDivider(
                text: S.text.or,
                vertical: Constants.kPaddingL,
              ),
              _alreadyHaveAnAccount(context),
            ],
          );
        },
      ),
    );
  }

  Form _buildForm(BuildContext context, AuthState state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: expandedSize(context, size: 0.1)),
          XInputCustom(
            labelText: S.text.field_email,
            prefixIcon: Icons.email,
            controller: _emailController,
            errorText: _getErrorText(state),
            keyboardType: TextInputType.emailAddress,
            validator: _emailValidator,
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

  String? _getErrorText(AuthState state) {
    return state.maybeWhen(
      orElse: () => null,
      isError: (e) => e.whenOrNull(
        unprocessableEntity: (m) => m.parseMessageWhenNull("email"),
      ),
    );
  }

  XButton _sendCodeButton(AuthState state) {
    return XButton(
      onPressed: () => _onButtonSendTokenPress(context),
      busy: state.maybeWhen(
        isLoading: () => true,
        orElse: () => false,
      ),
      title: S.text.send_code,
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
          onPressed: () => _gotToSignInView(),
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

  void _gotToSignInView() => XCoordinator.rootRouter.navigateBack();

  void _onButtonSendTokenPress(BuildContext context) {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.checkEmailExists(_emailController.text),
          );
    }
  }
}
