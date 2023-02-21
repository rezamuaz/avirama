import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/common/card.dart';
import '../../../network/model/customer/customer.dart';

class XCustomerItem extends StatelessWidget {
  const XCustomerItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Customer data;

  @override
  Widget build(BuildContext context) {
    return XCard(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const XCacheNetworkImage(
                  imageUrl: Constants.defaultProfilePhotoUrl,
                  size: Size(40, 40),
                ),
              ),
              const SizedBox(width: Constants.kPaddingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.customerName,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: Constants.kPaddingXS * 0.5),
                    Text(
                      data.phoneNumber,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Constants.kPaddingS),
              const Icon(
                Icons.arrow_right_alt_rounded,
                color: XColors.grey_40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
