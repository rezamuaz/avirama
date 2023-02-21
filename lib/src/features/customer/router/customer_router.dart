import 'package:absensi_app/src/features/customer/view/customer_view.dart';
import 'package:auto_route/auto_route.dart';

import 'customer_wrapper_view.dart';

class CustomerRouters {
  static const String index = '';
}

class CustomerCoordinator {
  static const autoRoute = AutoRoute(
    path: 'customer',
    name: "CustomerRouter",
    page: CustomerWrapperView,
    children: [
      AutoRoute(
        path: CustomerRouters.index,
        page: CustomerView,
        initial: true,
      ),
    ],
  );
}
