import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/shimmer/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme/colors.dart';

class XSocialAccountItemShimmer extends StatelessWidget {
  const XSocialAccountItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: XColors.shimmerBaseColor,
      highlightColor: XColors.shimmerHighlightColor,
      child: XShimmerListViewContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
        itemCount: 2,
        height: 32,
        maxWidth: 32,
        scrollDirection: Axis.vertical,
        itemDirection: Axis.horizontal,
        children: [
          const SizedBox(width: Constants.kPaddingS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                XShimmerContainer(height: 10, width: 150),
                SizedBox(height: Constants.kPaddingS),
                XShimmerContainer(height: 10, width: double.infinity),
                SizedBox(height: Constants.kPaddingM),
              ],
            ),
          )
        ],
      ),
    );
  }
}
