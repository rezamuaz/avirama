import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../localization/localization_utils.dart';
import '../../../common/setting/setting_bloc.dart';
import '../../widgets/list_section.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
        builder: (BuildContext context, state) {
      return XListSection(
        alwaysOpen: true,
        title: S.text.activities,
        children: [
          XSectionItem(
            onTap: () {},
            label: "Favorite",
            description: "Posts you like",
            icon: Icons.favorite_outline_rounded,
          ),
        ],
      );
    });
  }
}
