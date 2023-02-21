import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'auto_router.gr.dart';
import 'router_name.dart';

class XCoordinator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;

  static Future<bool> pop<T extends Object?>([T? result]) async {
    return rootRouter.pop(result);
  }

  static Future showDev() async {
    return rootRouter.pushNamed(XRoutes.dev);
  }

  static Future showHome() async {
    return await rootRouter.replaceNamed(
      XRoutes.dashBoard,
    );
  }
}
