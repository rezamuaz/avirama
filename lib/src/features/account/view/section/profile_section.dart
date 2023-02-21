import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/devices/app_info.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/constants/keys.dart';
import '../../../../network/model/user/user.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../../services/auth_service.dart';
import '../../../../theme/colors.dart';
import '../../widgets/section.dart';
import 'auth_section_body.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
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

  @override
  Widget build(BuildContext context) {
    return XSection(
      onTap: () => _goToUpdateProfileView(context),
      child: ValueListenableBuilder<User?>(
        valueListenable: _user,
        builder: (BuildContext context, User? user, Widget? child) {
          return isNullOrEmpty(user)
              ? const XAuthSectionBody()
              : _buildProfile(user!, context);
        },
      ),
    );
  }

  Row _buildProfile(User user, BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: "XProfilePhoto#",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: XCacheNetworkImage(
              imageUrl:
                  user.profilePhotoUrl ?? Constants.defaultProfilePhotoUrl,
              size: const Size(50, 50),
            ),
          ),
        ),
        const SizedBox(width: Constants.kPaddingS),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                (user.email ?? user.phoneNumber) ?? AppInfo.package.appName,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: Constants.kFontSizeS,
                      color: XColors.grey_80,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(width: Constants.kPaddingS),
        IconButton(
          onPressed: () => _goToUpdateProfileView(context),
          icon: const Icon(
            Icons.mode_edit_outline_outlined,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
