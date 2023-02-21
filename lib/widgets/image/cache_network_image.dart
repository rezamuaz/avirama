import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class XCacheNetworkImage extends StatelessWidget {
  const XCacheNetworkImage({
    Key? key,
    required this.imageUrl,
    this.size,
    this.fit,
    this.shimmerRadius,
    this.shimmerBaseColor,
    this.shimmerShape,
  }) : super(key: key);

  final String imageUrl;
  final Size? size;
  final BoxFit? fit;
  final double? shimmerRadius;
  final Color? shimmerBaseColor;
  final BoxShape? shimmerShape;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: (BuildContext context, String url, dynamic error) =>
          _whenErrorLoadImage(),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: shimmerBaseColor ?? XColors.shimmerBaseColor,
        highlightColor: XColors.shimmerHighlightColor,
        child: Container(
          height: size?.height,
          width: size?.width,
          decoration: BoxDecoration(
            shape: shimmerShape ?? BoxShape.rectangle,
            color: XColors.grey_20,
            borderRadius: shimmerShape == null
                ? BorderRadius.circular(
                    shimmerRadius ?? Constants.kFontSizeM,
                  )
                : null,
          ),
        ),
      ),
      width: size?.width,
      height: size?.height,
      fit: fit ?? BoxFit.cover,
    );
  }

  Container _whenErrorLoadImage() {
    return Container(
      height: size?.height,
      width: size?.width,
      decoration: BoxDecoration(
        color: XColors.grey_20,
        borderRadius: BorderRadius.circular(
          shimmerRadius ?? Constants.kFontSizeM,
        ),
      ),
      child: errorIcon(size),
    );
  }

  static Widget errorIcon(Size? size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.image_rounded,
          color: XColors.grey_40,
        ),
        // if size > 700
        if (size != null && size.width > 50)
          const SizedBox(height: Constants.kPaddingXS),
        if (size != null && size.width > 50)
          const Text(
            "Not Found",
            style: TextStyle(
              color: XColors.grey_40,
              fontSize: Constants.kFontSizeS,
            ),
          ),
      ],
    );
  }
}
