import 'package:flutter/material.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

import '../../src/localization/localization_utils.dart';
import '../../src/theme/colors.dart';

Future<void> selectTime(
  BuildContext context, {
  required Function(String) onPicked,
  DateTime? initialDateTime,
}) async {
  final result = await TimePicker.show(
    context: context,
    sheet: TimePickerSheet(
      initialDateTime: initialDateTime,
      sheetCloseIconColor: XAppColors.primary,
      saveButtonColor: XAppColors.primary,
      minuteTitleStyle:
          Theme.of(context).textTheme.headline6 ?? const TextStyle(),
      hourTitleStyle:
          Theme.of(context).textTheme.headline6 ?? const TextStyle(),
      sheetTitleStyle:
          Theme.of(context).textTheme.headline5 ?? const TextStyle(),
      wheelNumberSelectedStyle: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: XAppColors.primary) ??
          const TextStyle(),
      wheelNumberItemStyle:
          Theme.of(context).textTheme.bodyText2 ?? const TextStyle(),
      minuteInterval: 5,
      sheetTitle: 'Pilih Waktu',
      hourTitle: 'Jam',
      minuteTitle: 'Menit',
      saveButtonText: S.text.common_add,
    ),
  );

  if (result != null) {
    // get hour and minute from result
    final hour = result.hour;
    final minute = result.minute;
    // format hour and minute
    final hourString = hour.toString().padLeft(2, '0');
    final minuteString = minute.toString().padLeft(2, '0');

    final String time = "$hourString:$minuteString";

    onPicked(time);
  }
}
