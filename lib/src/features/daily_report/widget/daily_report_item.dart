import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/network/model/daily_report/daily_report.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/common/text_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/common/card.dart';

class XDailyReportItem extends StatelessWidget {
  const XDailyReportItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DailyReport data;

  String get createdAtFormated => DateFormat.yMMMEd(
        "ID",
      ).format(DateTime.parse(data.createdAt)).toString();

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
                      color: Colors.green.withOpacity(0.2)),
                  child: const Icon(
                    Icons.apartment_rounded,
                    color: Colors.green,
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
                      data.location,
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
          TextInfo(
            title: 'Tanggal & Waktu',
            text: "$createdAtFormated ${data.time}",
          ),
        ],
      ),
    );
  }
}
