import 'package:absensi_app/src/features/profile/bloc/bloc/profile_detail_bloc.dart';
import 'package:absensi_app/src/features/profile/view/section/profile_info.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileDetailBloc>(
      create: (context) =>
          ProfileDetailBloc()..add(const ProfileDetailEvent.getDetail()),
      child: Scaffold(
        // floatingActionButton: const DevFloatButton(),
        appBar: AppBar(
          title: const Text(
            "Profil Saya",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          backgroundColor: XAppColors.primaryColors,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 18,
              )),
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: const [ProfileInfo()],
        ),
      ),
    );
  }
}
