import 'package:flutter/material.dart';

selectDate(
  BuildContext context, {
  required Function(String) onPicked,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(), // Refer step 1
    firstDate: firstDate ?? DateTime(1930),
    lastDate: lastDate ?? DateTime.now(),
    initialDatePickerMode: DatePickerMode.day,
  );

  if (picked != null) {
    onPicked(picked.toString().substring(0, 11));
  }
}
