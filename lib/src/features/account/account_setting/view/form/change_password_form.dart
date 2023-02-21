import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../../widgets/common/bottom_sheet.dart';
import '../../../../../config/constants/keys.dart';
import '../../../../../localization/localization_utils.dart';
import '../../../../../network/model/account_setting/change_password/change_password.dart';
import '../../../../../network/model/user/user.dart';
import '../../../../../services/auth_service.dart';
import '../../logic/account_setting_bloc.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  late User user;
  ErrorResponseMessage? _error;

  final _currentPasswordController = TextEditingController();
  final _currentPasswordValidator =
      ValidationBuilder().required().minLength(8).build();

  final _passwordController = TextEditingController();
  final _passwordValidator =
      ValidationBuilder().required().minLength(8).build();

  final _repeatPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _blocListener(BuildContext context, AccountSettingState state) {
    state.whenOrNull(
      isError: (e) {
        _passwordController.text = '';
        _currentPasswordController.text = '';
        _repeatPasswordController.text = '';

        e.maybeWhen(
          orElse: () => FlashMessage.error(context: context, error: e),
          unprocessableEntity: (m) => _error = m,
        );
      },
      success: (v) => _onSuccess(context),
    );
  }

  @override
  void initState() {
    user = Auth.instance.user as User;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountSettingBloc, AccountSettingState>(
      listener: _blocListener,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.kPaddingL,
            vertical: Constants.kPaddingL,
          ),
          child: Column(
            children: [
              _form(context, state),
              const SizedBox(height: Constants.kPaddingL * 2),
              _confirmButton(state),
            ],
          ),
        );
      },
    );
  }

  Form _form(BuildContext context, AccountSettingState state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (user.isPasswordNull == false)
            XInputCustom(
              labelText: S.text.field_currentPassword,
              prefixIcon: Icons.password_rounded,
              controller: _currentPasswordController,
              errorText: _error.message('current_password'),
              keyboardType: TextInputType.visiblePassword,
              validator: _currentPasswordValidator,
              textInputAction: TextInputAction.next,
              obscureText: true,
              readOnly: state.maybeWhen(
                isLoading: () => true,
                orElse: () => false,
              ),
            ),
          if (user.isPasswordNull == false)
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
            // validator: _passwordValidator,
            obscureText: true,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmButton(AccountSettingState state) {
    double halfFullWidth = MediaQuery.of(context).size.width / 2;

    return Align(
      alignment: Alignment.centerRight,
      child: XButton(
        width: halfFullWidth > 150 ? 150 : halfFullWidth,
        onPressed: () => _onButtonConfirmPress(context),
        busy: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
        title: S.text.common_save,
      ),
    );
  }

  void _onButtonConfirmPress(BuildContext context) {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _error = null;
      final requests = ChangePassword(
        currentPassword: _currentPasswordController.text,
        password: _passwordController.text,
      );

      context
          .read<AccountSettingBloc>()
          .add(AccountSettingEvent.changePassword(requests));
    }
  }

  Future<void> _onSuccess(BuildContext context) async {
    if (user.isPasswordNull == true) {
      await GetStorage().write(
        XKeys.userData,
        user.copyWith(
          isPasswordNull: false,
        ),
      );
    }

    XBottomSheet.show(
      StateWidget.success(
        message: S.text.your_password_has_been_changed,
        buttonLabel: S.text.common_back,
        onButtonTap: () {
          XBottomSheet.hide();
          context.router.navigateBack();
        },
      ),
    );
  }
}
