import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../common/preload_lottie_asset.dart';

class XStateSendingEmailWidget extends StatelessWidget {
  const XStateSendingEmailWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPaddingXL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const XPreloadLottieAsset(
            lottiePath: "assets/lotties/sending_email.json",
            package: "arx",
          ),
          const SizedBox(height: Constants.kPaddingL),
          Row(
            children: [
              const SizedBox(
                width: Constants.kPaddingS + Constants.kFontSizeXL,
              ),
              Expanded(
                child: AutoSizeText(
                  text ?? "Sending Verification Code",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: XColors.grey_60,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: Constants.kPaddingS),
              const SizedBox(
                width: Constants.kFontSizeXL,
                height: Constants.kFontSizeXL,
                child: CircularProgressIndicator(
                  backgroundColor: XColors.grey_60,
                  strokeWidth: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
