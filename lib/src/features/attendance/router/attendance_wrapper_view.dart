import 'package:absensi_app/src/features/attendance/bloc/attendance_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceWrapperView extends StatelessWidget {
  const AttendanceWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BeforeAfterPhotoBloc>(
          create: (context) => BeforeAfterPhotoBloc(),
        ),
        BlocProvider<AttendanceBloc>(
          create: (context) => AttendanceBloc(),
        ),
        BlocProvider<DailyPhotoBloc>(
          create: (context) => DailyPhotoBloc(),
        ),
      ],
      child: const Scaffold(
        body: AutoRouter(),
      ),
    );
  }
}
