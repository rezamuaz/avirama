import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../../widgets/common/bottom_sheet.dart';
import '../../../../../config/constants/keys.dart';
import '../../../../../localization/localization_utils.dart';
import '../../../../../network/model/auth/sign_in/phone_number_request.dart';
import '../../../../../network/model/user/user.dart';
import '../../../../../services/auth_service.dart';
import '../../../../auth/widget/custom_country_code_picker.dart';
import '../../../../verfication/view/phone_number_verfication_view.dart';
import '../../logic/account_setting_bloc.dart';

class NewPhoneNumberForm extends StatefulWidget {
  const NewPhoneNumberForm({Key? key}) : super(key: key);

  @override
  State<NewPhoneNumberForm> createState() => _NewPhoneNumberFormState();
}

class _NewPhoneNumberFormState extends State<NewPhoneNumberForm> {
  ErrorResponseMessage? _error;
  String dialCode = dotenv.env['DEFAULT_DIAL_CODE']!;

  final _phoneNumberController = TextEditingController();
  final _phoneNumberValidator = ValidationBuilder().required().phone().build();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _blocListener(BuildContext context, AccountSettingState state) {
    state.whenOrNull(
      isError: (e) {
        e.maybeWhen(
          orElse: () => FlashMessage.error(context: context, error: e),
          unprocessableEntity: (m) => _error = m,
        );
      },
      successUpdatePhoneNumber: (v) => _onSuccess(context),
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

  Widget _confirmButton(AccountSettingState state) {
    double halfFullWidth = MediaQuery.of(context).size.width / 2;

    return Align(
      alignment: Alignment.centerRight,
      child: XButton(
        width: halfFullWidth > 150 ? 150 : halfFullWidth,
        onPressed: () => _onButtonConfirmPress(context),
        title: S.text.send_code,
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

      XPhoneNumberVerficationView.show(
        phoneNumber: dialCode + _phoneNumberController.text,
        onSuccess: _updatePhoneNumber,
      );
    }
  }

  void _updatePhoneNumber(String idToken) {
    context.read<AccountSettingBloc>().add(
          AccountSettingEvent.updatePhoneNumber(
            PhoneNumberRequest(firebaseVerifyIdToken: idToken),
          ),
        );
  }

  Future<void> _onSuccess(BuildContext context) async {
    final User user = Auth.instance.user as User;
    await GetStorage().write(
      XKeys.userData,
      user.copyWith(
        phoneNumber: dialCode + _phoneNumberController.text,
      ),
    );

    XBottomSheet.show(
      StateWidget.success(
        message: S.text.your_phone_number_has_been_updated,
        buttonLabel: S.text.common_back,
        onButtonTap: () {
          XBottomSheet.hide();
          context.router.navigateBack();
        },
      ),
    );
  }
}
