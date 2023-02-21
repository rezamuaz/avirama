import 'dart:developer' as dev;

import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../src/features/verfication/view/email_verification_view.dart';
import '../../src/network/domain_manager.dart';
import '../../src/network/model/auth/forgot_password/forgot_password.dart';
import '../widgets/dev_screen_layout.dart';

class DevOtherView extends StatelessWidget {
  const DevOtherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Other Widgets',
      children: [
        TextButton(
          onPressed: () => XToast.show("long press to continue"),
          onLongPress: () {
            FirebaseCrashlytics.instance.crash();
          },
          child: const Text("Throw Test Exception"),
        ),
        TextButton(
          onPressed: () {
            // generate random bool
            // bool r = Random().nextBool();

            FlashMessage.error(context: context);
          },
          child: const Text("Show Error Flash Message"),
        ),
        TextButton(
          onPressed: onTestVerifEmail,
          onLongPress: () {
            FirebaseCrashlytics.instance.crash();
          },
          child: const Text("Test Verif Email"),
        ),
        TextButton(
          onPressed: () {
            FlashMessage.show(context: context, message: "test");
          },
          onLongPress: () {
            FirebaseCrashlytics.instance.crash();
          },
          child: const Text("Test ARSTATE"),
        ),
      ],
    );
  }

  void onTestVerifEmail() {
    EmailVerificationView.show(
      args: EmailVerificationArgs(
        onSuccess: (String? token) {
          dev.log('=====================================');
          dev.log('token: $token');
          dev.log('=====================================');
        },
        email: "aryaanggara.dev@gmail.com",
        onSendEmail: () {
          return GetIt.I<DomainManager>().authRepository.forgotPassword(
                forgotPassword:
                    const ForgotPassword(email: "aryaanggara.dev@gmail.com"),
              );
        },
        onVerifyOtp: (String code) {
          return GetIt.I<DomainManager>()
              .authRepository
              .resetPasswordVerifToken(
                token: code,
              );
        },
      ),
    );
  }
}
