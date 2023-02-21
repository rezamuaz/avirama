import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/widgets/common/head_bar.dart';
import 'package:flutter/material.dart';

import '../../src/router/coordinator.dart';
import '../../src/theme/colors.dart';

class XBottomSelectOption extends StatelessWidget {
  const XBottomSelectOption({Key? key, required this.items}) : super(key: key);

  final List<XBottomSelectOptionItem> items;

  static show({required List<XBottomSelectOptionItem> items}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: XCoordinator.context,
      builder: (BuildContext bc) {
        return XBottomSelectOption(
          items: items,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Constants.kPaddingS),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constants.kRadiusL),
          topRight: Radius.circular(Constants.kRadiusL),
        ),
        color: XColors.white,
      ),
      child: SafeArea(
        child: Wrap(
          children: [
            const Center(child: XHeadBar()),
            ...items.map((e) {
              return ListTile(
                horizontalTitleGap: 0,
                leading: e.leading ??
                    Icon(
                      e.icon,
                      color: XAppColors.primary,
                    ),
                title: Text(
                  e.label,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  e.onTap?.call();
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class XBottomSelectOptionItem {
  IconData? icon;
  Widget? leading;
  String label;
  Function()? onTap;

  XBottomSelectOptionItem({
    this.icon,
    this.leading,
    required this.label,
    this.onTap,
  });
}
