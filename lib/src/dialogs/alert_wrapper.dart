import 'package:flutter/material.dart';

import '../localization/localization_utils.dart';
import '../router/coordinator.dart';
import 'widget/x_alert_dialog.dart';

class XAlert {
  static get context => XCoordinator.context;

  /// show the dialog
  static Future<String?> show({
    String? title,
    String? body,
    List<XAlertButton> actions = const [],
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return XAlertDialog(
          title: title,
          content: body,
          actions: actions,
        );
      },
    );
  }

  /// Shows a confirmation dialog
  Future showCustomAlert({
    Widget? title,
    Widget? body,
    List<XAlertButton> actions = const [],
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return XAlertDialog(
          titleWidget: title,
          contentWidget: body,
          actions: actions,
        );
      },
    );
  }

  static Future<bool> onWillPop(String message, {String? title}) async {
    dynamic result = await XAlert.show(
      title: title ?? S.text.common_areYouSure,
      body: message,
      actions: [
        XAlertButton(S.text.common_cancel, key: "0"),
        XAlertButton(S.text.common_yes, key: "1"),
      ],
    );
    return result == "1";
  }
}
