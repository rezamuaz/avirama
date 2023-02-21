import 'dart:developer';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/features/attendance/bloc/attendance_bloc.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../network/model/activity/activity.dart';
import '../../../network/model/attendance/attendance.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';
import '../../home/widget/home_app_bar_title.dart';

class AttendanceReviewView extends StatefulWidget {
  AttendanceReviewView({
    super.key,
    required this.attendance,
  });
  final Attendance attendance;

  @override
  State<AttendanceReviewView> createState() => _AttendanceReviewViewState();
}

class _AttendanceReviewViewState extends State<AttendanceReviewView> {
  List<Activity>? photoHarian;
  List<Activity>? photoBeforeAfter;
  int beforeAfterEntity = 0;
  int harianEntity = 0;

  _goToAddPhotoDailyView() {
    XCoordinator.rootRouter
        .push(
          AttendanceRouters(
            children: [AddPhotoDailyRoute(attendance: widget.attendance)],
          ),
        )
        .then((value) => _onRefresh());
  }

  _goToAddPhotoBeforeAfterView() {
    XCoordinator.rootRouter
        .push(
          AttendanceRouters(
            children: [AddPhotoBeforeAfterRoute(attendance: widget.attendance)],
          ),
        )
        .then((value) => _onRefresh());
  }

  _goToAddAttendanceOutView() {
    XCoordinator.rootRouter.push(
      AttendanceRouters(
        children: [AttendanceOutRoute(outlet: widget.attendance.dataOutlet)],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<BeforeAfterPhotoBloc>()
        .add(AttendanceEvent.beforeAfterCountEvent(widget.attendance.id));
    context
        .read<DailyPhotoBloc>()
        .add(AttendanceEvent.dailyPhotoCountEvent(widget.attendance.id));
    context
        .read<AttendanceBloc>()
        .add(AttendanceEvent.isAttendanceAllowedEvent(widget.attendance.id));
  }

  void _onExitAttendance() {
    log('message');
    _goToAddAttendanceOutView();
  }

  void _onRefresh() {
    log('_onRefresh');
    context
        .read<BeforeAfterPhotoBloc>()
        .add(AttendanceEvent.beforeAfterCountEvent(widget.attendance.id));
    context
        .read<DailyPhotoBloc>()
        .add(AttendanceEvent.dailyPhotoCountEvent(widget.attendance.id));
    context
        .read<AttendanceBloc>()
        .add(AttendanceEvent.isAttendanceAllowedEvent(widget.attendance.id));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => _onRefresh(),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              const HomeAppBarTitle(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Constants.kPaddingL),
                    attendanceDone(context),
                    const SizedBox(height: Constants.kPaddingL),
                    outletInfo(context),
                    const SizedBox(height: Constants.kPaddingL),
                    Text(
                      'Keterangan',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: Constants.kPaddingL),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tanggal Absen',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          widget.attendance.date,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: Constants.kPaddingXS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Koordinat Absen',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '${widget.attendance.dataOutlet.lang}, ${widget.attendance.dataOutlet.long}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: Constants.kPaddingL),
                    tambahFotoHarian(context),
                    const SizedBox(height: Constants.kPaddingL),
                    tambahFotoBeforeAfter(context),
                    const SizedBox(height: Constants.kPaddingXL),
                    BlocBuilder<AttendanceBloc, AttendanceState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          isAttendanceAllowed: (state) {
                            return XButton(
                              onPressed:
                                  (harianEntity > 0 && beforeAfterEntity > 1)
                                      ? _onExitAttendance
                                      : () {},
                              backgroundColor:
                                  (harianEntity > 0 && beforeAfterEntity > 1)
                                      ? Colors.lightGreen
                                      : XAppColors.danger.withOpacity(0.5),
                              title: state
                                  ? 'Lakukan Absensi Keluar'
                                  : 'Absensi Keluar',
                            );
                          },
                          orElse: () => XButton(
                            onPressed: _onExitAttendance,
                            backgroundColor: XAppColors.danger,
                            title: 'Absensi Keluar',
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: Constants.kPaddingS),
                    const AutoSizeText(
                      'Segera melapor apabila anda tidak dapat melakukan absensi keluar',
                      minFontSize: 3,
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: Constants.kPaddingL),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tambahFotoHarian(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Foto Harian',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              BlocBuilder<DailyPhotoBloc, AttendanceState>(
                bloc: context.read<DailyPhotoBloc>(),
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      log('orElse ');
                      return Text(
                        'Jumlah Foto:0',
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    },
                    isLoading: () =>
                        const Center(child: CircularProgressIndicator()),
                    dailyCount: (dailyCount) {
                      harianEntity = dailyCount;
                      log('dailyCount $dailyCount');
                      return Text(
                        'Jumlah Foto:$dailyCount',
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: Constants.kPaddingM),
          XButton(
            onPressed: _goToAddPhotoDailyView,
            backgroundColor: XAppColors.primaryLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.camera_alt),
                SizedBox(
                  width: Constants.kPaddingS,
                ),
                Text('Tambah Foto Harian'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tambahFotoBeforeAfter(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Foto Before And After',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              BlocBuilder<BeforeAfterPhotoBloc, AttendanceState>(
                bloc: context.read<BeforeAfterPhotoBloc>(),
                builder: (context, state) {
                  return state.maybeWhen(
                    beforeAfterCount: (count) {
                      beforeAfterEntity = count;
                      return Text(
                        'Jumlah Foto:$count',
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    },
                    isLoading: () => const CircularProgressIndicator(),
                    orElse: () => Text(
                      'Jumlah Foto:0',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: Constants.kPaddingM),
          XButton(
            onPressed: _goToAddPhotoBeforeAfterView,
            backgroundColor: XAppColors.primaryLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.camera_alt),
                SizedBox(width: Constants.kPaddingS),
                Text('Tambah Foto Before After'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget attendanceDone(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Anda sudah absen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: Constants.kPaddingXS),
        Text(
          'Berikut adalah outlet yang aktif absen sekarang.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget outletInfo(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Assets.svgs.smallOutletIcon.svg(),
            const SizedBox(width: Constants.kPaddingL),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.attendance.outlet,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  FittedBox(
                    child: AutoSizeText(
                      widget.attendance.dataOutlet.address,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
