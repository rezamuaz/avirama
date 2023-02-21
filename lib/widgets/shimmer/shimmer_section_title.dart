import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'shimmer_container.dart';

class XShimmerSectionTitle extends StatelessWidget {
  const XShimmerSectionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              XShimmerContainer(
                height: 14,
                width: 110,
              ),
              SizedBox(height: Constants.kPaddingS),
              XShimmerContainer(
                height: 10,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: Constants.kPaddingXL,
        ),
        const XShimmerContainer(
          height: 10,
          width: 90,
        ),
      ],
    );
  }
}
