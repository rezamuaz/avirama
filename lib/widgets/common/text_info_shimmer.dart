import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/shimmer/shimmer_container.dart';
import 'package:flutter/material.dart';

class TextInfoShimmer extends StatelessWidget {
  const TextInfoShimmer({super.key});

  static Widget expanded() {
    return const Expanded(
      child: TextInfoShimmer(),
    );
  }

  static Widget count({
    required int itemCount,
    bool expand = false,
  }) {
    Widget result = Row(
      children: [
        for (var i = 0; i < itemCount; i++)
          const Expanded(child: TextInfoShimmer()),
      ],
    );

    return expand ? Expanded(child: result) : result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: Constants.kPaddingS - 2),
        XShimmerContainer(height: 8, width: 68),
        SizedBox(height: Constants.kPaddingS),
        XShimmerContainer(height: 10, width: 30),
      ],
    );
  }
}
