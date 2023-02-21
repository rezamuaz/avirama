import 'package:absensi_app/src/features/attendance/bloc/attendance_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashbBoardWrapperView extends StatelessWidget {
  const DashbBoardWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
    );
  }
}
