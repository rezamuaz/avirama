import 'package:flutter/material.dart';

import '../../src/router/coordinator.dart';

class DevFloatButton extends StatelessWidget {
  const DevFloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.2,
      onPressed: () => XCoordinator.showDev(),
      child: const Icon(Icons.developer_mode_rounded),
    );
  }
}
