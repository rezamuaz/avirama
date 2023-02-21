import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/forms/pin_put.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../localization/localization_utils.dart';
import '../../logic/verification_bloc.dart';

class EmailVerficationForm extends StatefulWidget {
  const EmailVerficationForm({Key? key, required this.onVerifyOtp})
      : super(key: key);

  final Future<ApiResult<String>> Function(String) onVerifyOtp;

  @override
  State<EmailVerficationForm> createState() => _EmailVerficationFormState();
}

class _EmailVerficationFormState extends State<EmailVerficationForm> {
  final _otpController = TextEditingController();
  final _otpValidator = ValidationBuilder().required().minLength(6).build();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationBloc, VerificationState>(
      builder: (context, state) {
        return _buildForm(context, state);
      },
    );
  }

  Form _buildForm(BuildContext context, VerificationState state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          XPintPut(
            controller: _otpController,
            enabled: state.maybeWhen(
              isLoading: () => false,
              orElse: () => true,
            ),
            forceErrorState: _getErrorText(state) != null,
            onSubmitted: (_) => _onButtonVerifyEmailPress(context),
            errorText: _getErrorText(state),
            validator: _otpValidator,
          ),
          const SizedBox(height: Constants.kPaddingL * 2),
          _verifyEmailButton(state),
        ],
      ),
    );
  }

  String? _getErrorText(VerificationState state) {
    return state.maybeWhen(
      orElse: () => null,
      isError: (e) => e.whenOrNull(
        unprocessableEntity: (m) => m.parseMessageWhenNull('key'),
      ),
    );
  }

  XButton _verifyEmailButton(VerificationState state) {
    return XButton(
      onPressed: () => _onButtonVerifyEmailPress(context),
      busy: state.maybeWhen(
        isLoading: () => true,
        orElse: () => false,
      ),
      title: S.text.verify,
    );
  }

  void _onButtonVerifyEmailPress(BuildContext context) {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      context.read<VerificationBloc>().add(
            VerificationEvent.verifyOtp(
              widget.onVerifyOtp,
              _otpController.text,
            ),
          );
    }
  }
}
