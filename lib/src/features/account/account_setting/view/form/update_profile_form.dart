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
import '../../../../../network/model/account_setting/update_profile/update_profile.dart';
import '../../../../../network/model/user/user.dart';
import '../../../../../router/auto_router.gr.dart';
import '../../../../../services/auth_service.dart';
import '../../logic/account_setting_bloc.dart';

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({Key? key}) : super(key: key);

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  ErrorResponseMessage? _error;

  final _nameController = TextEditingController();
  final _nameValidator = ValidationBuilder().required().minLength(5).build();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late User user;
  final GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    user = Auth.instance.user as User;
    _nameController.text = user.name;
    _phoneNumberController.text = user.phoneNumber ?? "-";
    _emailController.text = user.email ?? "-";
  }

  void _blocListener(BuildContext context, AccountSettingState state) {
    state.whenOrNull(
      isError: (e) {
        e.maybeWhen(
          orElse: () => FlashMessage.error(context: context, error: e),
          unprocessableEntity: (m) => _error = m,
        );
      },
      success: (v) => _onSuccess(context),
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
          XInputCustom(
            labelText: S.text.field_name,
            prefixIcon: Icons.person_rounded,
            controller: _nameController,
            errorText: _error.message("name"),
            keyboardType: TextInputType.name,
            validator: _nameValidator,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          const SizedBox(height: Constants.kPaddingM),
          XInputCustom(
            labelText: S.text.field_email,
            prefixIcon: Icons.email,
            controller: _emailController,
            readOnly: true,
            onTap: () => _updateEmail(context),
            suffixIcon: IconButton(
              onPressed: () => _updateEmail(context),
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: Constants.kPaddingL,
              ),
            ),
          ),
          const SizedBox(height: Constants.kPaddingM),
          XInputCustom(
            labelText: S.text.field_phoneNumber,
            prefixIcon: Icons.phone_android_rounded,
            controller: _phoneNumberController,
            readOnly: true,
            onTap: () => _updatePhoneNumber(context),
            suffixIcon: IconButton(
              onPressed: () => _updatePhoneNumber(context),
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: Constants.kPaddingL,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updatePhoneNumber(BuildContext context) {
    context.router.popAndPush(
      const AccountSettingRouter(
        children: [
          UpdatePhoneNumberRoute(),
        ],
      ),
    );
  }

  void _updateEmail(BuildContext context) {
    context.router.popAndPush(
      const AccountSettingRouter(
        children: [
          UpdateEmailRoute(),
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
      final requests = UpdateProfile(
        name: _nameController.text,
      );

      context
          .read<AccountSettingBloc>()
          .add(AccountSettingEvent.updateProfile(requests));
    }
  }

  Future<void> _onSuccess(BuildContext context) async {
    await GetStorage().write(
      XKeys.userData,
      user.copyWith(name: _nameController.text),
    );

    XBottomSheet.show(
      StateWidget.success(
        message: S.text.your_profile_has_been_updated,
        buttonLabel: S.text.common_back,
        onButtonTap: () {
          XBottomSheet.hide();
          context.router.navigateBack();
        },
      ),
    );
  }
}
