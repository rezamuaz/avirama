import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/features/account/widgets/section.dart';
import 'package:absensi_app/src/features/profile/bloc/bloc/profile_detail_bloc.dart';
import 'package:absensi_app/src/features/profile/widget/box_info.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool show = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return XSection(
      onTap: () {},
      child: BlocBuilder<ProfileDetailBloc, ProfileDetailState>(
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 200,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Hero(
                        tag: "XProfilePhoto#",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: XCacheNetworkImage(
                            imageUrl: state.whenOrNull(
                                    isLoading: () =>
                                        Constants.defaultProfilePhotoUrl,
                                    detailedProfile: (data) => data.foto,
                                    isError: (error) =>
                                        Constants.defaultProfilePhotoUrl) ??
                                Constants.defaultProfilePhotoUrl,
                            size: const Size(120, 120),
                          ),
                        ),
                      ),
                      const SizedBox(height: Constants.kPaddingS),
                      Expanded(
                        child: Text(
                          state.whenOrNull(
                                  isLoading: () => "",
                                  detailedProfile: (data) => data.name) ??
                              "",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                show = !show;
                              }),
                              child: BoxInfo(
                                  boxColor:
                                      const Color.fromARGB(255, 168, 60, 0),
                                  title: 'Gaji Anda',
                                  contentColor: XColors.grey_60,
                                  content: show
                                      ? state.whenOrNull(
                                              detailedProfile: (data) =>
                                                  data.salary) ??
                                          '0'
                                      : "Lihat"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: BoxInfo(
                                title: 'Total Hari Kerja',
                                contentColor: XColors.grey_60,
                                boxColor:
                                    const Color.fromARGB(255, 70, 122, 202),
                                content: state.whenOrNull(
                                        detailedProfile: (data) => data
                                            .totalAttendanceMountly
                                            .toString()) ??
                                    '0'),
                          )
                        ]),
                        const SizedBox(height: Constants.kPaddingM),
                        Expanded(
                          child: BoxInfo(
                              title: 'Persen Absensi',
                              contentColor: XColors.grey_60,
                              boxColor: const Color.fromARGB(255, 0, 168, 132),
                              content: state.whenOrNull(
                                  detailedProfile: (data) =>
                                      "${data.percent.toString()}%")),
                        )
                      ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
