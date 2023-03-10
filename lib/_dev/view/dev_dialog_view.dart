import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../src/dialogs/alert_wrapper.dart';
import '../widgets/dev_button_title.dart';
import '../widgets/dev_screen_layout.dart';

class DevDialogView extends StatelessWidget {
  const DevDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Dialog',
      children: [
        DevButtonTitle('1. Show Dialog', onTap: () {
          XAlert.show(title: 'title', body: 'dialog content');
        }),
        DevButtonTitle('2. Show full screen loading', onTap: () async {
          showLoading(context);
          await Future.delayed(const Duration(seconds: 1));
          updateLoading('90%');
          await Future.delayed(const Duration(seconds: 1));
          hideLoading();
        }),
        DevButtonTitle('3. Show Toast', onTap: () {
          XToast.show('Default Toast');
        }),
        DevButtonTitle(
          '4. Show Default Bottom Sheet',
          onTap: () => _DemoBottomSheet.show(context),
        ),
      ],
    );
  }
}

class _DemoBottomSheet extends StatelessWidget {
  const _DemoBottomSheet({Key? key}) : super(key: key);
  static show(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => const _DemoBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modal Page',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView.builder(itemBuilder: (_, i) {
        return ListTile(
          title: Text('Item ${i + 1}'),
          onTap: () => _DemoBottomSheet.show(context),
        );
      }),
    );
  }
}
