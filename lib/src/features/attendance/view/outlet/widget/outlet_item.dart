import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/common/text_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../widgets/common/card.dart';
import '../../../../../network/model/outlet/outlet.dart';
import 'outlet_maps.dart';

class XOutletItem extends StatelessWidget {
  const XOutletItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Outlet data;

  String get createdAtFormated => DateFormat.yMMMEd(
        "ID",
      ).format(DateTime.parse(data.createdAt!)).toString();

  @override
  Widget build(BuildContext context) {
    return XCard(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data.status != '1'
                        ? Colors.red.withOpacity(0.2)
                        : Colors.green.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.location_on_sharp,
                    color: data.status != '1' ? Colors.red : Colors.green,
                  ),
                ),
              ),
              const SizedBox(width: Constants.kPaddingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: Constants.kPaddingXS * 0.5),
                    Text(
                      data.address,
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
          const SizedBox(height: Constants.kPaddingM),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(
                  text: 'Status: ',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                data.status != '1'
                    ? const TextSpan(text: 'Menunggu konfirmasi admin')
                    : const TextSpan(text: 'Terkonfirmasi admin')
              ],
            ),
          )
        ],
      ),
    );
  }
}
