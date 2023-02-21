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
import '../../../../../../widgets/forms/input_gender.dart';
import '../../../../../config/constants/keys.dart';
import '../../../../../localization/localization_utils.dart';
import '../../../../../network/model/user/personal_information.dart';
import '../../../../../network/model/user/user.dart';
import '../../../../../services/auth_service.dart';
import '../../../../../utils/select_date.dart';
import '../../logic/account_setting_bloc.dart';

class UpdatePersonalInformationForm extends StatefulWidget {
  const UpdatePersonalInformationForm({Key? key}) : super(key: key);

  @override
  State<UpdatePersonalInformationForm> createState() =>
      _UpdatePersonalInformationFormState();
}

class _UpdatePersonalInformationFormState
    extends State<UpdatePersonalInformationForm> {
  ErrorResponseMessage? _error;

  final _placeOfBirthController = TextEditingController();
  final _placeOfBirthValidator = ValidationBuilder().minLength(3).build();

  final _dateOfBirthController = TextEditingController();
  final _dateOfBirthValidator = ValidationBuilder().minLength(8).build();

  Gender? _gender = Gender.male;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late User user;
  final GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    user = Auth.instance.user as User;

    _placeOfBirthController.text = user.personalInformation?.placeOfBirth ?? '';
    _dateOfBirthController.text = user.personalInformation?.dateOfBirth ?? '';
    _gender = user.personalInformation?.gender?.toGender();
  }

  void _blocListener(BuildContext context, AccountSettingState state) {
    state.whenOrNull(
      isError: (e) {
        e.maybeWhen(
          orElse: () => FlashMessage.error(context: context, error: e),
          unprocessableEntity: (m) => _error = m,
        );
      },
      successUpdatePersonalInformation: (v) => _onSuccess(context, v),
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
          const SizedBox(height: Constants.kPaddingM),
          XInputCustom(
            labelText: S.text.place_of_birth,
            prefixIcon: Icons.location_city_rounded,
            controller: _placeOfBirthController,
            errorText: _error.message("place_of_birth"),
            validator: _placeOfBirthValidator,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          const SizedBox(height: Constants.kPaddingM),
          XInputCustom(
            labelText: S.text.date_of_birth,
            prefixIcon: Icons.date_range_rounded,
            controller: _dateOfBirthController,
            errorText: _error.message("date_of_birth"),
            validator: _dateOfBirthValidator,
            readOnly: true,
            onTap: _selectDateOfBirth,
            suffixIcon: IconButton(
              onPressed: _selectDateOfBirth,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: Constants.kPaddingL,
              ),
            ),
          ),
          const SizedBox(height: Constants.kPaddingM),
          XInputGenderCustom(
            initialGender: _gender,
            onChanged: (v) => _gender = v,
          ),
        ],
      ),
    );
  }

  void _selectDateOfBirth() {
    selectDate(
      context,
      initialDate: _getInitialDate(),
      onPicked: (v) {
        setState(() {
          _dateOfBirthController.text = v;
        });
      },
    );
  }

  DateTime? _getInitialDate() {
    try {
      return DateTime.parse(_dateOfBirthController.text);
    } catch (_) {
      return null;
    }
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
      final requests = PersonalInformation(
        placeOfBirth: _placeOfBirthController.text,
        dateOfBirth: _dateOfBirthController.text,
        gender: _gender.string(),
      );

      context.read<AccountSettingBloc>().add(
            AccountSettingEvent.updatePersonalInformation(requests),
          );
    }
  }

  Future<void> _onSuccess(
    BuildContext context,
    PersonalInformation personalInformation,
  ) async {
    await GetStorage().write(
      XKeys.userData,
      user.copyWith(personalInformation: personalInformation),
    );

    XBottomSheet.show(
      StateWidget.success(
        message: S.text.your_persona_information_has_been_updated,
        buttonLabel: S.text.common_back,
        onButtonTap: () {
          XBottomSheet.hide();
          context.router.navigateBack();
        },
      ),
    );
  }
}
