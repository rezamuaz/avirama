import 'package:flutter/material.dart';

import '../../src/router/coordinator.dart';
import '../router/dev_router.dart';
import '../widgets/dev_navigation_title.dart';

class DevView extends StatelessWidget {
  const DevView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            XCoordinator.pop();
          },
        ),
        title: Text(
          'Dev Only',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: const [
          DevNavigationTitle('1. Device Info', screenName: DevRouters.device),
          DevNavigationTitle('2. Theme', screenName: DevRouters.theme),
          DevNavigationTitle('3. Text Theme', screenName: DevRouters.textTheme),
          DevNavigationTitle('4. Button', screenName: DevRouters.button),
          DevNavigationTitle('5. Text Input', screenName: DevRouters.input),
          DevNavigationTitle('6. Dialog', screenName: DevRouters.dialog),
          DevNavigationTitle('7. State UI', screenName: DevRouters.state),
          DevNavigationTitle('8. Other', screenName: DevRouters.other),
        ],
      ),
    );
  }
}
