import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/widgets/state/state_sending_email_widget.dart';
import 'package:flutter/material.dart';

import '../../src/dialogs/alert_wrapper.dart';
import '../../src/dialogs/widget/x_alert_dialog.dart';
import '../../src/localization/localization_utils.dart';
import '../../widgets/common/bottom_sheet.dart';
import '../widgets/dev_button_title.dart';
import '../widgets/dev_screen_layout.dart';

class DevStateUIView extends StatelessWidget {
  const DevStateUIView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'State UI',
      children: [
        DevButtonTitle(
          '~ Dialog Confirmation',
          onTap: () => _showDialogConfirmation(),
        ),
        DevButtonTitle(
          '~ Success Widget',
          onTap: () => XBottomSheet.show(
            StateWidget.success(
              title: 'Success',
              message: S.text.we_have_sent_the_otp,
              onButtonTap: () => XBottomSheet.hide(),
              buttonLabel: S.text.common_next,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Sending Email',
          onTap: () => XBottomSheet.show(
            const XStateSendingEmailWidget(),
          ),
        ),
        DevButtonTitle(
          '~ No Data',
          onTap: () => XBottomSheet.show(
            StateWidget.noData(),
          ),
        ),
        DevButtonTitle(
          '~ No Result',
          onTap: () => XBottomSheet.show(
            StateWidget.noResult(),
          ),
        ),
        DevButtonTitle(
          '~ Searching',
          onTap: () => XBottomSheet.show(
            StateWidget.searching(),
          ),
        ),
        DevButtonTitle(
          '~ 404 Widget',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.notFound(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Internal Server Error',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.internalServerError(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Service Unavailable',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.serviceUnavailable(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Request Timeout',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.requestTimeout(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Conflict',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.conflict(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Unauthorised Request',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.unauthorisedRequest(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Unable To Process The Data',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.unableToProcess(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Request Cancelled',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.requestCancelled(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Bad Request',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.badRequest(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Method Not Alowed',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.methodNotAllowed(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Not Acceptable',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.notAcceptable(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Send Timeout',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.sendTimeout(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Not Implemented',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.notImplemented(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ No Internet Connection',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.noInternetConnection(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Format Exception',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.formatException(),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Default Error',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.defaultError("error"),
              onRetry: _pop,
            ),
          ),
        ),
        DevButtonTitle(
          '~ Unexpected Error',
          onTap: () => XBottomSheet.show(
            StateWidget.error(
              error: const NetworkExceptions.unexpectedError(),
              onRetry: _pop,
            ),
          ),
        ),
      ],
    );
  }

  void _pop() => XBottomSheet.hide();

  void _showDialogConfirmation() {
    XAlert.show(
      title: S.text.common_areYouSure,
      body: S.text.common_are_you_sure_you_want_to_close,
      actions: [
        XAlertButton(S.text.common_cancel, key: "0"),
        XAlertButton(S.text.common_yes, key: "1"),
      ],
    );
  }
}
