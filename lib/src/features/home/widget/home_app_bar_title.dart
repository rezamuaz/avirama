import 'package:absensi_app/gen/assets.gen.dart';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../config/constants/keys.dart';
import '../../../network/model/user/user.dart';
import '../../../router/auto_router.gr.dart';
import '../../../services/auth_service.dart';

class HomeAppBarTitle extends StatefulWidget {
  const HomeAppBarTitle({Key? key}) : super(key: key);

  @override
  State<HomeAppBarTitle> createState() => _HomeAppBarTitleState();
}

class _HomeAppBarTitleState extends State<HomeAppBarTitle> {
  late ValueNotifier<User?> _user;

  // late User user;
  final GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    _user = ValueNotifier<User?>(Auth.instance.user);
    _onUserDataOnChanged();
  }

  void _onUserDataOnChanged() {
    box.listenKey(XKeys.userData, (user) {
      if (mounted) {
        _user.value = user;
      }
    });
  }

  // go to update profile view
  void _goToUpdateProfileView(BuildContext context) {
    context.router.push(
      const AccountSettingRouter(
        children: [
          UpdateProfileRoute(),
        ],
      ),
    );
  }

  final String dateNowFormated =
      DateFormat("dd MMM yyyy", "ID").format(DateTime.now()).toString();

  final String timeNowFormated =
      DateFormat("HH:mm:ss", "ID").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToUpdateProfileView(context),
      child: ValueListenableBuilder<User?>(
        valueListenable: _user,
        builder: (BuildContext context, User? user, Widget? child) {
          return user != null ? _buildWidget(user, context) : Container();
        },
      ),
    );
  }

  Widget _buildWidget(User user, BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.homeHeaderBackground
              .image(
                fit: BoxFit.fitWidth,
              )
              .image,
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Constants.kPaddingL,
            Constants.kPaddingXL, Constants.kPaddingL, Constants.kPaddingL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Flexible(
                //   child: Container(
                //       height: 40,
                //       alignment: Alignment.center,
                //       padding: const EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           color: Colors.blueGrey),
                //       child: Text(
                //         user.jabatan!,
                //         textAlign: TextAlign.center,
                //         style: const TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //             fontSize: Constants.kFontSizeL,
                //             letterSpacing: 2),
                //       )),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: XCacheNetworkImage(
                    imageUrl: user.profilePhotoUrl ??
                        Constants.defaultProfilePhotoUrl,
                    size: const Size(50, 50),
                  ),
                ),
              ],
            ),
            const SizedBox(width: Constants.kPaddingM),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      constraints:
                          const BoxConstraints(maxHeight: 22, maxWidth: 50),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.elliptical(20, 5),
                              bottomRight: Radius.zero,
                              bottomLeft: Radius.elliptical(20, 5)),
                          color: XAppColors.green),
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      child: Text(
                        user.jabatan!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: Constants.kFontSizeS,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo, ",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        "${user.name}!",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingXS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.date_range_rounded,
                        color: Colors.white,
                        size: Constants.kFontSizeL,
                      ),
                      const SizedBox(width: Constants.kPaddingXS),
                      Text(
                        dateNowFormated,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(width: Constants.kPaddingL),
                      const Icon(
                        Icons.access_time_filled_rounded,
                        color: Colors.white,
                        size: Constants.kFontSizeL,
                      ),
                      const SizedBox(width: Constants.kPaddingXS),
                      Text(
                        timeNowFormated,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingXS),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
