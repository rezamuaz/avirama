import 'package:absensi_app/src/features/attendance/view/add_photo_daily_view.dart';
import 'package:absensi_app/src/features/attendance/view/attendance_history_view.dart';
import 'package:absensi_app/src/features/attendance/view/attendance_in_done_view.dart';
import 'package:absensi_app/src/features/attendance/view/attendance_out_done_view.dart';
import 'package:absensi_app/src/features/attendance/view/attendance_out_view.dart';
import 'package:absensi_app/src/features/attendance/view/attendance_review_view.dart';
import 'package:absensi_app/src/router/router_name.dart';
import 'package:auto_route/auto_route.dart';
import '../view/add_photo_before_after.dart';
import '../view/attendance_in_view.dart';
import '../view/select_outlet_view.dart';
import 'attendance_wrapper_view.dart';

class AttendanceRouters {
  static const String selectOutlet = 'select-outlet';
  static const String attendanceIn = 'attendance-in';
  static const String attendanceDone = 'attendance-done';
  static const String attendanceReview = 'attendance-review';
  static const String addPhotoDaily = 'add-photo-daily';
  static const String addPhotoPhotoBeforeAfter = 'add-photo-before-after';
  static const String attendanceOut = 'attendance-out';
  static const String attendanceDoneOut = 'attendance-done-out';
  static const String attendanceHistory = 'attendance-history';
}

class AttendanceCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.attendance,
    name: "AttendanceRouters",
    page: AttendanceWrapperView,
    children: [
      AutoRoute(
        path: AttendanceRouters.selectOutlet,
        page: SelectOutletView,
      ),
      AutoRoute(
        path: AttendanceRouters.attendanceIn,
        page: AttendanceInView,
      ),
      AutoRoute(
        path: AttendanceRouters.attendanceDone,
        page: AttendanceDoneView,
      ),
      AutoRoute(
        path: AttendanceRouters.attendanceReview,
        page: AttendanceReviewView,
      ),
      AutoRoute(
        path: AttendanceRouters.addPhotoDaily,
        page: AddPhotoDailyView,
      ),
      AutoRoute(
        path: AttendanceRouters.addPhotoPhotoBeforeAfter,
        page: AddPhotoBeforeAfterView,
      ),
      AutoRoute(
        path: AttendanceRouters.attendanceOut,
        page: AttendanceOutView,
      ),
      AutoRoute(
        path: AttendanceRouters.attendanceOut,
        page: AttendanceOutDoneView,
      ),
      AutoRoute(
        path: AttendanceRouters.attendanceHistory,
        page: AttendanceHistoryView,
      ),
    ],
  );
}
