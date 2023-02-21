import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../widgets/common/bottom_sheet.dart';
import '../../../dialogs/alert_wrapper.dart';
import '../../../localization/localization_utils.dart';
import '../../../network/model/auth/reset_password/reset_password.dart';
import '../common/expand_size.dart';
import '../logic/auth_bloc.dart';
import '../widget/custom_auth_scaffold.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key, required this.helperKey}) : super(key: key);

  final String helperKey;

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  ErrorResponseMessage? _error;

  final _passwordController = TextEditingController();
  final _passwordValidator =
      ValidationBuilder().required().minLength(8).build();

  final _repeatPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _authBlocListener(BuildContext context, AuthState state) {
    state.whenOrNull(
      success: (_) => _onSuccess(),
      isError: (e) => e.whenOrNull(
        unprocessableEntity: (m) => _error = m,
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return XAlert.onWillPop(
      S.text.are_you_sure_you_want_to_cancel_the_password_reset_process,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: CustomAuthScaffold(
        title: S.text.new_password,
        description: S.text.you_can_create_new_password,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: _authBlocListener,
          builder: (context, state) {
            return Column(
              children: [
                _form(context, state),
                _confirmNewPasswordButton(state),
              ],
            );
          },
        ),
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
            labelText: S.text.field_password,
            prefixIcon: Icons.password_rounded,
            controller: _passwordController,
            errorText: _error.message("password"),
            keyboardType: TextInputType.visiblePassword,
            validator: _passwordValidator,
            textInputAction: TextInputAction.next,
            obscureText: true,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          const SizedBox(
            height: Constants.kPaddingL,
          ),
          XInputCustom(
            labelText: S.text.field_repeatPassword,
            prefixIcon: Icons.password_rounded,
            controller: _repeatPasswordController,
            errorText: _error.message("password"),
            keyboardType: TextInputType.visiblePassword,
            validator: (String? e) {
              if (e != _passwordController.text) {
                return S.text.validation_passwordAreNotTheSame;
              }
              return null;
            },
            obscureText: true,
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

  XButton _confirmNewPasswordButton(AuthState state) {
    return XButton(
      onPressed: () => _onButtonConfirmNewPasswordPress(context),
      busy: state.maybeWhen(
        isLoading: () => true,
        orElse: () => false,
      ),
      title: S.text.confirm_new_password,
    );
  }

  void _onButtonConfirmNewPasswordPress(BuildContext context) {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _error = null;
      final requests = ResetPassword(
        key: widget.helperKey,
        password: _passwordController.text,
      );

      context.read<AuthBloc>().add(AuthEvent.resetPassword(requests));
    }
  }

  void _onSuccess() {
    XBottomSheet.show(
      StateWidget.success(
        message: S.text.your_password_has_been_changed,
        buttonLabel: S.text.sign_in,
        onButtonTap: () {
          XBottomSheet.hide();
          context.router.navigateBack();
        },
      ),
    );
  }
}
