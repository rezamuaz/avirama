import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/state_content_type.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/src/features/attendance/bloc/attendance_bloc.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../network/model/outlet/outlet.dart';
import '../../../router/coordinator.dart';

class AttendanceOutDoneView extends StatefulWidget {
  const AttendanceOutDoneView(
      {super.key,
      required this.item,
      required this.path,
      required this.lang,
      required this.long,
      required this.note});
  final Outlet item;
  final String path;
  final String lang;
  final String long;
  final String note;

  @override
  State<AttendanceOutDoneView> createState() => _AttendanceOutDoneViewState();
}

class _AttendanceOutDoneViewState extends State<AttendanceOutDoneView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Absensi Keluar',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: AttendanceOutDoneBody(
          item: widget.item,
          path: widget.path,
          lang: widget.lang,
          long: widget.long,
          note: widget.note,
        ),
      ),
    );
  }
}

class AttendanceOutDoneBody extends StatelessWidget {
  const AttendanceOutDoneBody(
      {super.key,
      required this.item,
      required this.path,
      required this.lang,
      required this.long,
      required this.note});
  final Outlet item;
  final String path;
  final String lang;
  final String long;
  final String note;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      bloc: context.read<AttendanceBloc>()
        ..add(
          AttendanceEvent.attendanceOutRequest(
              item.id.toString(), path, lang, long, note),
        ),
      builder: (context, state) {
        return state.maybeWhen(
          isLoadingCheckIn: () => const Center(
            child: CircularProgressIndicator(),
          ),
          attendanceinResult: (result) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                result.status
                    ? Assets.svgs.absensiSelesai.svg()
                    : const Icon(
                        size: 90,
                        Icons.warning,
                        color: Colors.red,
                      ),
                const SizedBox(height: Constants.kPaddingXS),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    result.status ? 'Absensi Selesai' : 'Absensi Gagal',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(height: Constants.kPaddingXS),
                Text(
                  result.message,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.kPaddingM,
                  ),
                  child: XButton(
                    onPressed: () => XCoordinator.showHome(),
                    backgroundColor: XAppColors.primary,
                    child: const Text('Kembali'),
                  ),
                ),
                const SizedBox(height: Constants.kPaddingXL),
                const SizedBox(height: Constants.kPaddingXL),
              ],
            );
          },
          isError: (e) {
            return StateWidget.error(
              stateContentType: StateContentType.full,
              error: e,
            );
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
