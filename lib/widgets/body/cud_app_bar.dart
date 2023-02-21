import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../common/bottom_sheet.dart';

class CudAppBar extends StatelessWidget {
  const CudAppBar({
    Key? key,
    required this.title,
    this.onDelete,
    this.action,
  }) : super(key: key);

  final String title;
  final Function()? onDelete;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.kPaddingS,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => XBottomSheet.hide(),
                child: Text(
                  'Batalkan',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              if (action != null) action!,
              if (onDelete != null)
                TextButton(
                  onPressed: () => onDelete?.call(),
                  child: Text(
                    'Hapus',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.kPaddingL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
