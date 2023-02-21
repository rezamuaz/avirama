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

class AttendanceDoneView extends StatefulWidget {
  const AttendanceDoneView(
      {super.key,
      required this.item,
      required this.path,
      required this.lang,
      required this.long});
  final SelectOutlet item;
  final String path;
  final String lang;
  final String long;

  @override
  State<AttendanceDoneView> createState() => _AttendanceDoneViewState();
}

class _AttendanceDoneViewState extends State<AttendanceDoneView> {
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
            'Absensi Masuk',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: AttendanceDoneBody(
          item: widget.item,
          path: widget.path,
          lang: widget.lang,
          long: widget.long,
        ),
      ),
    );
  }
}

class AttendanceDoneBody extends StatelessWidget {
  const AttendanceDoneBody(
      {super.key,
      required this.item,
      required this.path,
      required this.lang,
      required this.long});
  final SelectOutlet item;
  final String path;
  final String lang;
  final String long;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      bloc: context.read<AttendanceBloc>()
        ..add(
          AttendanceEvent.attendanceInRequest(item.id, path, lang, long),
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
