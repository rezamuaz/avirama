import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/features/verfication/view/phone_number_verfication_view.dart';
import 'package:absensi_app/widgets/state/state_sending_email_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/common/bottom_sheet.dart';
import '../../../dialogs/alert_wrapper.dart';
import '../../../localization/localization_utils.dart';
import '../logic/verification_bloc.dart';
import '../widgets/verification_view_wrapper.dart';
import 'form/email_verfication_form.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({Key? key, required this.args}) : super(key: key);

  final EmailVerificationArgs args;

  static show({required EmailVerificationArgs args}) {
    XBottomSheet.showStyleTwo(
      EmailVerificationView(
        args: args,
      ),
    );
  }

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  bool isCanPop = false;

  Future<bool> _onWillPop() async {
    if (isCanPop) return true;

    return XAlert.onWillPop(
      S.text.are_you_sure_you_want_to_cancel_the_email_verification_process,
    );
  }

  void _verificationBlocListener(
    BuildContext context,
    VerificationState state,
  ) {
    state.whenOrNull(
      isError: (e) {
        e.maybeWhen(
          orElse: () => FlashMessage.error(
            context: context,
            error: e,
          ),
          unprocessableEntity: (_) {},
        );
      },
      successVerify: (String otpText) {
        isCanPop = true;
        widget.args.onSuccess(otpText);
        Navigator.of(context).pop(otpText);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocProvider(
        create: (context) => VerificationBloc()..add(_resendCodeEvent),
        child: BlocConsumer<VerificationBloc, VerificationState>(
          listener: _verificationBlocListener,
          builder: (context, state) {
            return state.maybeWhen(
              isSending: () => XVerficationViewWrapper(
                title: S.text.verify_email,
                child: const XStateSendingEmailWidget(),
              ),
              orElse: () => XVerficationViewWrapper(
                title: S.text.verify_email,
                description: S.text.please_type_otp_email(widget.args.email),
                onResendCode: () => _onResendCode(context),
                children: [
                  EmailVerficationForm(
                    onVerifyOtp: widget.args.onVerifyOtp,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onResendCode(BuildContext context) =>
      context.read<VerificationBloc>().add(
            _resendCodeEvent,
          );

  VerificationEvent get _resendCodeEvent =>
      VerificationEvent.sendVerificationCode(widget.args.onSendEmail);
}

class EmailVerificationArgs {
  final String email;
  final Function(String) onSuccess;
  final Future<ApiResult<String>> Function() onSendEmail;
  final Future<ApiResult<String>> Function(String) onVerifyOtp;

  EmailVerificationArgs({
    required this.email,
    required this.onSuccess,
    required this.onSendEmail,
    required this.onVerifyOtp,
  });
}
