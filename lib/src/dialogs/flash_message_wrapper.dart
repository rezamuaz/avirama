import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/src/dialogs/widget/flash_message_content.dart';
import 'package:flutter/material.dart';

class FlashMessage {
  static void show({
    required BuildContext context,
    required String message,
    String? title,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FlashMessageContent(
          message: message,
          title: title,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  static void error({
    required BuildContext context,
    dynamic error,
    String? title,
    String? message,
  }) {
    if (error is NetworkExceptions) {
      title = title ??= error.message();
      message = message ??= error.messageDescription();
    }

    show(
      context: context,
      title: title ?? lookupMessages.ohSnap(),
      message: message ?? lookupMessages.somethingWhenWrong(),
    );
  }
}
