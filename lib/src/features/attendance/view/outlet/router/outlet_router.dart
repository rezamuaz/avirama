import 'package:auto_route/auto_route.dart';

import '../view/outlet_view.dart';
import 'outlet_router_wrapper_view.dart';

class OutletRouters {
  static const String index = '';
}

class OutletCoordinator {
  static const autoRoute = AutoRoute(
    path: 'Outlet',
    name: "OutletRouter",
    page: OutletWrapperView,
    children: [
      AutoRoute(
        path: OutletRouters.index,
        page: OutletView,
        initial: true,
      ),
    ],
  );
}
