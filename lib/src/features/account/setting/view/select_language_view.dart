import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/common/back_button.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../theme/colors.dart';
import '../../../common/setting/setting_bloc.dart';
import '../../widgets/form_content_header.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({Key? key}) : super(key: key);

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  // Declare this variable
  late int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(BuildContext context, int? val) {
    setState(() {
      selectedRadioTile = val ?? 1;
      context.read<SettingBloc>().onChangeLang(
            val == 2 ? const Locale('en', '') : const Locale('id', ''),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (BuildContext context, state) {
        selectedRadioTile = state.locale == const Locale('id', '')
            ? 1
            : state.locale == const Locale('en', '')
                ? 2
                : 0;
        return Scaffold(
          appBar: AppBar(
            leading: const XBackButton(),
            title: Text(
              S.text.select_language,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          body: ListView(
            children: [
              XFormContentHeader(
                title: S.text.set_language,
                description: S.text.the_language_to_be_used,
              ),
              _langItem(
                context,
                value: 1,
                title: 'ID',
                subtitle: "Indonesia",
                imagePath: Assets.images.locale.id.path,
              ),
              _langItem(
                context,
                value: 2,
                title: 'EN',
                subtitle: "English",
                imagePath: Assets.images.locale.en.path,
              ),
            ],
          ),
        );
      },
    );
  }

  RadioListTile<int> _langItem(
    BuildContext context, {
    required value,
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Constants.kPaddingL,
      ),
      value: value,
      groupValue: selectedRadioTile,
      title: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            width: Constants.kPaddingS,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: XColors.grey_60,
                width: 0.5,
              ),
            ),
            child: Image.asset(
              imagePath,
              width: Constants.kFontSizeXL,
            ),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: XColors.grey_80,
            ),
      ),
      onChanged: (int? val) {
        setSelectedRadioTile(context, val);
      },
    );
  }
}
