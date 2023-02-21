import 'package:absensi_app/src/network/model/attendance/attendance.dart';
import 'package:absensi_app/src/network/model/customer/customer.dart';
import 'data/account_setting/account_setting_repository.dart';
import 'data/account_setting/account_setting_repository_impl.dart';
import 'data/auth/auth_repository.dart';
import 'data/auth/auth_repository_impl.dart';
import 'data/notification/notification_repository.dart';
import 'data/notification/notification_repository_impl.dart';
import 'data/resource/resource_repository.dart';
import 'data/resource/resource_repository_impl.dart';
import 'model/activity/activity.dart';
import 'model/daily_report/daily_report.dart';
import 'model/outlet/outlet.dart';

class DomainManager {
  late AuthRepository authRepository;
  late AccountSettingRepository accountSettingRepository;
  late NotificationRepository notificationRepository;
  late ResourceRepository<Customer> customerRepository;
  late ResourceRepository<DailyReport> dailyReportRepository;
  late ResourceRepository<Outlet> outletRepository;
  late ResourceRepository<Outlet> outletLocationRepository;
  late ResourceRepository<Attendance> attendanceRepository;
  late ResourceRepository<SelectOutlet> selectOutletRepository;
  late ResourceRepository<SelectOutlet> selectOutletDetailRepository;

  late ResourceRepository<AttendanceInResult> attendanceInRepository;
  late ResourceRepository<Activity> activityRepository;

  DomainManager() {
    authRepository = AuthRepositoryImpl();
    accountSettingRepository = AccountSettingRepositoryImpl();
    notificationRepository = NotificationRepositoryImpl();

    customerRepository = ResourceRepositoryImpl<Customer>(
      '/customer',
    );
    dailyReportRepository = ResourceRepositoryImpl<DailyReport>(
      '/daily-report',
    );
    outletRepository = ResourceRepositoryImpl<Outlet>(
      '/store',
    );
    outletLocationRepository = ResourceRepositoryImpl<Outlet>(
      '/store/all-store',
    );
    attendanceRepository = ResourceRepositoryImpl<Attendance>(
      '/attendance/my-attendance',
    );
    selectOutletRepository = ResourceRepositoryImpl<SelectOutlet>(
      '/store/list',
    );
    selectOutletDetailRepository = ResourceRepositoryImpl<SelectOutlet>(
      '/store/list/',
    );
    attendanceInRepository = ResourceRepositoryImpl<AttendanceInResult>(
      '/attendance/check-int',
    );
    attendanceInRepository = ResourceRepositoryImpl<AttendanceInResult>(
      '/activity',
    );
  }
}
