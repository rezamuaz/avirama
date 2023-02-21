import 'package:absensi_app/gen/assets.gen.dart';
import 'package:absensi_app/src/config/constants/constants.dart';

import '../../core/exception/arstate.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FlashMessageContent extends StatelessWidget {
  const FlashMessageContent({Key? key, this.title, required this.message})
      : super(key: key);

  final String? title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        contents(context),
        bubleIcon(),
        Positioned(
          top: -16,
          left: Constants.kPaddingS,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Assets.svgs.fail.svg(
                height: 40,
              ),
              Positioned(
                top: 10,
                child: Assets.svgs.close.svg(
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container contents(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFC72C41),
        borderRadius: BorderRadius.circular(Constants.kRadiusL),
      ),
      child: Row(
        children: [
          const SizedBox(width: 48),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Constants.kPaddingS),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? lookupMessages.ohSnap(),
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: Constants.kPaddingXS * 0.1),
                  AutoSizeText(
                    message,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                          fontSize: Constants.kFontSizeM,
                        ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned bubleIcon() {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Constants.kRadiusL),
        child: Assets.svgs.bubbles.svg(
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
