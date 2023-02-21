import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../localization/localization_utils.dart';
import '../../../../router/auto_router.gr.dart';
import '../../../common/setting/setting_bloc.dart';
import '../../widgets/list_section.dart';

class AppSettingSection extends StatelessWidget {
  const AppSettingSection({Key? key}) : super(key: key);

  // go to set langguage view
  void _goToLanguageView(BuildContext context) {
    context.router.push(
      const SettingRouter(
        children: [
          SelectLanguageRoute(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
        builder: (BuildContext context, state) {
      return XListSection(
        title: S.text.app_setting,
        children: [
          XSectionItem(
            onTap: () => _goToLanguageView(context),
            label: S.text.language,
            description: S.text.change_app_language,
            icon: Icons.language_rounded,
          ),
        ],
      );
    });
  }
}
