import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:absensi_app/widgets/common/preload_lottie_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../gen/assets.gen.dart';
import '../../../localization/localization_utils.dart';
import '../../../network/model/auth/sign_in/sign_in_social_account.dart';
import '../logic/auth_bloc.dart';

class XSignInWithGoogleButton extends StatefulWidget {
  const XSignInWithGoogleButton({
    Key? key,
    this.isLoading = false,
  }) : super(key: key);

  final bool isLoading;

  @override
  State<XSignInWithGoogleButton> createState() =>
      _XSignInWithGoogleButtonState();
}

class _XSignInWithGoogleButtonState extends State<XSignInWithGoogleButton> {
  Future<void> _handleSignIn() async {
    GoogleSignIn().signIn().then((result) {
      result?.authentication.then((googleKey) {
        context.read<AuthBloc>().add(
              AuthEvent.socialAccount(
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

  @override
  Widget build(BuildContext context) {
    return XOutlinedButton(
      onPressed: _handleSignIn,
      busy: widget.isLoading,
      withHorizontalPadding: false,
      showLoadingWidget: false,
      child: Expanded(
        child: Row(
          children: [
            XPreloadLottieAsset(lottiePath: Assets.lotties.googleLogo),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: Constants.kPaddingXL),
                  child: Text(S.text.sign_in_with_google),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
