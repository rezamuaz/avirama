import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/config/devices/app_info.dart';
import 'package:absensi_app/src/utils/x_lauch_url.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/button/outlined_button.dart';
import 'package:absensi_app/widgets/common/preload_lottie_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../gen/assets.gen.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';
import '../widget/logout_footer.dart';

class PedingStatusView extends StatelessWidget {
  const PedingStatusView({
    Key? key,
  }) : super(key: key);

  Future<void> _onRefresh(BuildContext context) async {
    await XCoordinator.rootRouter.replaceAll([const SplashRoute()]);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
      child: ListView(
        padding: const EdgeInsets.all(Constants.kPaddingL),
        children: [
          Assets.apps.biramaPng.image(height: 38),
          const SizedBox(height: Constants.kPaddingS),
          Text(
            AppInfo.package.appName,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: const Color(0xFF076BA2),
                  fontWeight: FontWeight.normal,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Constants.kPaddingXL),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 212,
                child: XPreloadLottieAsset(
                  lottiePath: Assets.lotties.verification,
                ),
              ),
              const SizedBox(height: Constants.kPaddingL),
              Text(
                'Mohon Maaf',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.orange[700],
                    ),
              ),
              const SizedBox(height: Constants.kPaddingXS),
              Text(
                'Akun anda sudah terdaftar, namun Admin belum konfirmasi Anda sebagai akun aktif, siilahkan coba lagi nanti atau hubungi CS Kami',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Constants.kPaddingXL * 2),
              Row(
                children: [
                  Expanded(
                    child: XOutlinedButton(
                      onPressed: () => _onRefresh(context),
                      title: 'Refresh',
                    ),
                  ),
                  const SizedBox(width: Constants.kPaddingL),
                  Expanded(
                    child: XButton(
                      onPressed: () {
                        xlaunchUrl(dotenv.env['CS_URL']);
                      },
                      title: 'Hubungi CS',
                    ),
                  ),
                ],
              ),
              const LogoutFooter(),
            ],
          ),
        ],
      ),
    );
  }
}
