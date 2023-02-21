import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/constants/keys.dart';
import 'package:absensi_app/src/features/aktifitas_sales/daftar_aktifitas.dart';
import 'package:absensi_app/src/features/attendance/bloc/attendance_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/photo_activity_view.dart';
import 'package:absensi_app/src/features/laporan_omset/laporan_omset.dart';
import 'package:absensi_app/src/features/pic/daftar_outlet_pic.dart';
import 'package:absensi_app/src/features/profile/view/profile_view.dart';
import 'package:absensi_app/src/features/report/tambah_report_view.dart';
import 'package:absensi_app/src/network/model/user/user.dart';
import 'package:absensi_app/src/router/coordinator.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/common/card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../gen/assets.gen.dart';
import '../../../network/model/attendance/attendance.dart';
import '../../../router/auto_router.gr.dart';
import '../widget/home_app_bar_title.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Attendance? attendance;
  User? user;

  @override
  void initState() {
    final GetStorage box = GetStorage();
    user = box.read(XKeys.userData);
    super.initState();
  }

  void refresh(BuildContext context) {
    context
        .read<AttendanceBloc>()
        .add(const AttendanceEvent.activeAttendance());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => refresh(context),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const HomeAppBarTitle(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kPaddingL,
                vertical: Constants.kFontSizeL + Constants.kPaddingS,
              ),
              child: BlocBuilder<AttendanceBloc, AttendanceState>(
                bloc: context.read<AttendanceBloc>()
                  ..add(const AttendanceEvent.activeAttendance()),
                builder: (context, state) {
                  return state.maybeWhen(
                    loadedActiveAttendance: (att) {
                      attendance = att;
                      return outletInfo(
                        context,
                        att,
                      );
                    },
                    isDataNull: () => XButton(
                      backgroundColor: XAppColors.primary,
                      title: 'Lakukan Absen',
                      onPressed: _goToSelectOutletView,
                    ),
                    orElse: () => XButton(
                      backgroundColor: XAppColors.primary,
                      title: 'Lakukan Absen',
                      onPressed: _goToSelectOutletView,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kPaddingL,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMenu(
                      context,
                      icon: Icons.access_time_filled_rounded,
                      label: 'Riwayat Absensi',
                      onTap: _goToAttendanceHistoryView,
                    ),
                  ),
                  const SizedBox(width: Constants.kPaddingM),
                  Expanded(
                    child: _buildMenu(
                      context,
                      icon: Icons.work_history_rounded,
                      label: 'Laporan Kerja',
                      onTap: _goToDailyReportView,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Constants.kPaddingM),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kPaddingL,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMenu(
                      context,
                      icon: Icons.groups_rounded,
                      label: 'Customer',
                      onTap: _goToCustomerView,
                    ),
                  ),
                  const SizedBox(width: Constants.kPaddingM),
                  Expanded(
                    child: _buildMenu(
                      onTap: _goToOutletView,
                      context,
                      icon: Icons.location_pin,
                      label: 'Lokasi',
                    ),
                  ),
                ],
              ),
            ),
            // if (user!.jabatan == "TL")
            //   const SizedBox(height: Constants.kPaddingM),
            // if (user!.jabatan == "TL")
            //   Padding(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: Constants.kPaddingL,
            //     ),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: _buildMenu(
            //             context,
            //             icon: Icons.my_location_sharp,
            //             label: 'Track Location',
            //             onTap: _gotoDaftarAktitasView,
            //           ),
            //         ),
            //         const SizedBox(width: Constants.kPaddingM),
            //         Expanded(
            //           child: _buildMenu(
            //             context,
            //             icon: Icons.leaderboard_sharp,
            //             label: 'Laporan Omset',
            //             onTap: _gotoLaporanOmsetView,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // if (user!.jabatan == "TL")
            //   const SizedBox(height: Constants.kPaddingM),
            // if (user!.jabatan == "TL")
            //   Padding(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: Constants.kPaddingL,
            //     ),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: _buildMenu(
            //             context,
            //             icon: Icons.personal_injury_rounded,
            //             label: 'PIC',
            //             onTap: _gotoPICView,
            //           ),
            //         ),
            //         const SizedBox(width: Constants.kPaddingM),
            //         Expanded(
            //           child: _buildMenu(
            //             onTap: _gotoPhotoActivityView,
            //             context,
            //             icon: Icons.image,
            //             label: 'Photos',
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            const SizedBox(height: Constants.kPaddingM),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kPaddingL,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMenu(
                      context,
                      icon: Icons.email_rounded,
                      label: 'Report',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TambahReportView()));
                      },
                    ),
                  ),
                  const SizedBox(width: Constants.kPaddingM),
                  Expanded(
                    child: _buildMenu(
                      context,
                      icon: Icons.person,
                      label: 'Profile',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProfileView()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Constants.kPaddingM),
          ],
        ),
      ),
    );
  }

  Widget onAttendanceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Anda sudah absen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: Constants.kPaddingXS),
        Text(
          'Untuk keluar absen, silahkan untuk pilih absensi anda.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget outletInfo(BuildContext context, Attendance attendance) {
    return GestureDetector(
      onTap: _goToAttendanceReview,
      child: Column(
        children: [
          onAttendanceInfo(context),
          const SizedBox(height: Constants.kPaddingL),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: Colors.green,
            child: Row(
              children: [
                Assets.svgs.smallOutletInvert.svg(),
                const SizedBox(width: Constants.kPaddingL),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attendance.outlet,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      AutoSizeText(
                        attendance.dataOutlet.address,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                        minFontSize: 4,
                        maxLines: 3,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(
    BuildContext context, {
    required String label,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: XCard(
        width: double.infinity,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            Icon(
              icon,
              color: XAppColors.green,
              size: 52,
            ),
            const SizedBox(height: Constants.kPaddingS),
            Text(label, style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }

  _goToCustomerView() {
    XCoordinator.rootRouter
        .push(const CustomerRouter(children: [CustomerRoute()]));
  }

  _goToDailyReportView() {
    XCoordinator.rootRouter
        .push(const DailyReportRouter(children: [DailyReportRoute()]));
  }

  _goToOutletView() {
    XCoordinator.rootRouter.push(const OutletRouter(children: [OutletRoute()]));
  }

  _goToSelectOutletView() {
    XCoordinator.rootRouter
        .push(AttendanceRouters(children: [SelectOutletRoute()]));
  }

  _goToAttendanceReview() {
    XCoordinator.rootRouter.push(AttendanceRouters(
        children: [AttendanceReviewRoute(attendance: attendance!)]));
  }

  _goToAttendanceHistoryView() {
    XCoordinator.rootRouter
        .push(const AttendanceRouters(children: [AttendanceHistoryRoute()]));
  }

  _gotoPhotoActivityView() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PhotoActivityView()));
  }

  _gotoPICView() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const DaftarOutletPIC()));
  }

  _gotoDaftarAktitasView() {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const DaftarAktifitasView()));
  }

  _gotoLaporanOmsetView() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LaporanOmsetView()));
  }
}
