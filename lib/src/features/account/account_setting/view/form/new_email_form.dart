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
import '../../../../../network/model/account_setting/change_email/change_email_request.dart';
import '../../../../../network/model/user/user.dart';
import '../../../../../services/auth_service.dart';
import '../../logic/account_setting_bloc.dart';

class NewEmailForm extends StatefulWidget {
  const NewEmailForm({Key? key, required this.helperKey}) : super(key: key);

  final String? helperKey;

  @override
  State<NewEmailForm> createState() => _NewEmailFormState();
}

class _NewEmailFormState extends State<NewEmailForm> {
  ErrorResponseMessage? _error;

  final _emailController = TextEditingController();
  final _emailValidator = ValidationBuilder().required().email().build();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _blocListener(BuildContext context, AccountSettingState state) {
    state.whenOrNull(
      isError: (e) {
        e.maybeWhen(
          orElse: () => FlashMessage.error(context: context, error: e),
          unprocessableEntity: (m) => _error = m,
        );
      },
      successUpdateEmail: (v) => _onSuccess(context),
    );
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
              _form(state),
              const SizedBox(height: Constants.kPaddingL * 2),
              _confirmButton(state),
            ],
          ),
        );
      },
    );
  }

  Form _form(AccountSettingState state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
        title: S.text.common_save,
        busy: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
    );
  }

  void _onButtonConfirmPress(BuildContext context) async {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _error = null;

      ChangeEmailRequest request = ChangeEmailRequest(
        email: _emailController.text,
        key: widget.helperKey,
      );

      context.read<AccountSettingBloc>().add(
            AccountSettingEvent.updateEmail(request),
          );
    }
  }

  Future<void> _onSuccess(BuildContext context) async {
    final User user = Auth.instance.user as User;
    await GetStorage().write(
      XKeys.userData,
      user.copyWith(
        email: _emailController.text,
      ),
    );

    XBottomSheet.show(
      StateWidget.success(
        message: S.text.your_email_has_been_updated,
        buttonLabel: S.text.common_back,
        onButtonTap: () {
          XBottomSheet.hide();
          context.router.navigateBack();
        },
      ),
    );
  }
}
