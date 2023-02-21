import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/shimmer/shimmer_container.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/common/card.dart';
import '../../../../widgets/common/text_info_shimmer.dart';

class XDailyReportItemShimmer extends StatelessWidget {
  const XDailyReportItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _item(),
        const SizedBox(height: Constants.kPaddingS),
        _item(),
        const SizedBox(height: Constants.kPaddingS),
        _item(),
      ],
    );
  }

  XCard _item() {
    return XCard(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const XShimmerContainer(height: 40, width: 40),
              const SizedBox(width: Constants.kPaddingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: Constants.kPaddingS - 2),
                    XShimmerContainer(height: 12, width: 68),
                    SizedBox(height: Constants.kPaddingS),
                    XShimmerContainer(height: 10, width: 94),
                  ],
                ),
              ),
              const SizedBox(width: Constants.kPaddingM),
              const XShimmerContainer(height: 6, width: 22),
            ],
          ),
          const SizedBox(height: Constants.kPaddingM),
          const TextInfoShimmer(),
        ],
      ),
    );
  }
}
