import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/widgets/common/preload_lottie_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/common/bottom_select_option.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/model/auth/sign_in/sign_in_social_account.dart';
import '../../../../theme/colors.dart';
import '../logic/account_setting_bloc.dart';

class XAddSocialAccountFloatingButton extends StatelessWidget {
  const XAddSocialAccountFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: XColors.white,
      onPressed: () => _showPickerOptions(context),
      icon: const Icon(
        Icons.add,
        color: XAppColors.primary,
      ),
      label: Text(
        S.text.common_add,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: XAppColors.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  void _showPickerOptions(BuildContext context) {
    XBottomSelectOption.show(
      items: [
        XBottomSelectOptionItem(
          leading: SizedBox(
            width: 40,
            child: XPreloadLottieAsset(lottiePath: Assets.lotties.googleLogo),
          ),
          label: S.text.google,
          onTap: () => _handleGoogle(context),
        ),
      ],
    );
  }

  Future<void> _handleGoogle(BuildContext context) async {
    GoogleSignIn().signIn().then((result) {
      result?.authentication.then((googleKey) {
        context.read<AccountSettingBloc>().add(
              AccountSettingEvent.addSocialAccount(
                SignInSocialAccount(
                  provider: "google",
                  token: googleKey.accessToken!,
                ),
              ),
            );
      }).catchError((_) {
        _onError(context);
      });
    }).catchError((_) {
      _onError(context);
    });
  }

  void _onError(BuildContext context) => FlashMessage.error(context: context);
}
