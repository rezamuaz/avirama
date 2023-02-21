import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:flutter/material.dart';

import '../widgets/dev_screen_layout.dart';
import '../widgets/dev_title.dart';

class DevButtonView extends StatefulWidget {
  const DevButtonView({Key? key}) : super(key: key);

  @override
  State<DevButtonView> createState() => _DevButtonViewState();
}

class _DevButtonViewState extends State<DevButtonView> {
  bool busy = false;
  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Button',
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      children: [
        _title('Button State'),
        CheckboxListTile(
            title: const Text('Loading'),
            value: busy,
            onChanged: (val) {
              setState(() {
                busy = !busy;
              });
            }),
        CheckboxListTile(
            title: const Text('Enabled'),
            value: enabled,
            onChanged: (val) {
              setState(() {
                enabled = !enabled;
              });
            }),
        _title('1. IconButton'),
        IconButton(
          onPressed: enabled ? () {} : null,
          icon: const Icon(Icons.add_circle),
        ),
        _title('2. XButton'),
        XButton(
          busy: busy,
          enabled: enabled,
          onPressed: () {},
          child: const Text('XButton'),
        ),
        _title('2. XOutlinedButton'),
        XOutlinedButton(
          busy: busy,
          enabled: enabled,
          onPressed: () {},
          child: const Text('XOutlinedButton'),
        ),
      ],
    );
  }

  Widget _title(String title) {
    return DevTitle(
      title,
      horizontalPadding: 0,
    );
  }
}
