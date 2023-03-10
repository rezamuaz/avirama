import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/dev_screen_layout.dart';

class DevThemeView extends StatelessWidget {
  const DevThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DevScreenLayout('Theme',
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        children: []);
  }
}
