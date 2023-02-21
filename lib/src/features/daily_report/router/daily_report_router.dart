import 'package:auto_route/auto_route.dart';

import '../view/daily_report_view.dart';
import 'daily_report_wrapper_view.dart';

class DailyReportRouters {
  static const String index = '';
}

class DailyReportCoordinator {
  static const autoRoute = AutoRoute(
    path: 'DailyReport',
    name: "DailyReportRouter",
    page: DailyReportWrapperView,
    children: [
      AutoRoute(
        path: DailyReportRouters.index,
        page: DailyReportView,
        initial: true,
      ),
    ],
  );
}
