import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/common/show_country_code_with_flag.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

import '../../src/theme/colors.dart';

class XImageWithCategoryBadge extends StatelessWidget {
  const XImageWithCategoryBadge({
    Key? key,
    required this.imageUrl,
    this.categoryName,
    this.countryCode,
  }) : super(key: key);

  final String imageUrl;
  final String? categoryName;
  final String? countryCode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        XCacheNetworkImage(
          imageUrl: imageUrl,
          size: const Size(double.infinity, 226),
          shimmerRadius: Constants.kRadiusM,
        ),
        Positioned.fill(
          top: 206,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (categoryName != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(Constants.kRadiusL),
                    ),
                    color: XAppColors.primary.withOpacity(0.75),
                  ),
                  child: Text(
                    categoryName!,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                          fontSize: Constants.kFontSizeS,
                        ),
                  ),
                ),
              if (countryCode != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: Constants.kPaddingL,
                    bottom: Constants.kPaddingXS,
                  ),
                  child: XShowCountryCodeWithFlag(
                    width: 16,
                    countryCode: countryCode!,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
