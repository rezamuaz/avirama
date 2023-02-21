import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DevCopyTitle extends StatelessWidget {
  const DevCopyTitle(
    this.title,
    this.body, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String? body;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(body ?? ''),
      trailing: const Icon(Icons.copy_outlined),
      onTap: () {
        XToast.show('copied to clipboard');
        Clipboard.setData(ClipboardData(text: body ?? ''));
      },
    );
  }
}
