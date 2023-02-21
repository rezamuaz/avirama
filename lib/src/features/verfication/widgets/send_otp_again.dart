import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../../../localization/localization_utils.dart';
import '../../../theme/colors.dart';

class XSendOtpAgain extends StatefulWidget {
  const XSendOtpAgain({
    Key? key,
    this.onTap,
    this.busy = false,
  }) : super(key: key);

  final Function()? onTap;
  final bool busy;

  @override
  State<XSendOtpAgain> createState() => _XSendOtpAgainState();
}

class _XSendOtpAgainState extends State<XSendOtpAgain> {
  late int endTime;

  @override
  void initState() {
    endTime = getDuration();
    super.initState();
  }

  int getDuration() {
    return DateTime.now()
        .add(const Duration(minutes: 5))
        .millisecondsSinceEpoch;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.text.not_receiving_otp_code,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        CountdownTimer(
          endTime: endTime,
          widgetBuilder: (_, time) {
            final String label = time == null
                ? S.text.send_code_again
                : timeToStringFormated(time);
            return TextButton(
              onPressed: !widget.busy ? () => _onTap(time) : null,
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: XAppColors.primary,
                    ),
              ),
            );
          },
        ),
      ],
    );
  }

  String timeToStringFormated(CurrentRemainingTime time) {
    final String min = time.min == null
        ? "00"
        : time.min! > 9
            ? time.min!.toString()
            : "0${time.min!}";
    final String sec = time.sec == null
        ? "00"
        : time.sec! > 9
            ? time.sec.toString()
            : "0${time.sec}";
    return "$min:$sec";
  }

  void _onTap(CurrentRemainingTime? time) {
    if (time == null) {
      setState(() {
        widget.onTap?.call();
        endTime = getDuration();
      });
    }
  }
}
