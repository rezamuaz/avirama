import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../src/localization/localization_utils.dart';
import '../../src/theme/colors.dart';

enum Gender { male, female }

class XInputGenderCustom extends StatefulWidget {
  const XInputGenderCustom({
    Key? key,
    required this.initialGender,
    this.onChanged,
  }) : super(key: key);

  final Gender? initialGender;
  final Function(Gender)? onChanged;

  @override
  State<XInputGenderCustom> createState() => _XInputGenderCustomState();
}

class _XInputGenderCustomState extends State<XInputGenderCustom> {
  late Gender? _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.initialGender;
  }

  void _onTap(Gender gender) {
    setState(() {
      _gender = gender;
      widget.onChanged?.call(gender);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: Constants.kPaddingS),
        Row(
          children: [
            _item(
              icon: Icons.male_rounded,
              label: S.text.male,
              gender: Gender.male,
            ),
            const SizedBox(width: Constants.kPaddingS),
            _item(
              icon: Icons.female_rounded,
              label: S.text.female,
              gender: Gender.female,
            ),
          ],
        ),
      ],
    );
  }

  Expanded _item({
    required IconData icon,
    required String label,
    required Gender gender,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTap(gender),
        child: Container(
          height: Theme.of(context).buttonTheme.height,
          padding: Theme.of(context).inputDecorationTheme.contentPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constants.kRadiusM),
            color: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: Constants.kPaddingL,
                color: _gender == gender
                    ? Theme.of(context).primaryColor
                    : XColors.grey_60,
              ),
              const SizedBox(width: Constants.kPaddingM),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                ),
              ),
              if (_gender == gender)
                Icon(
                  Icons.check_rounded,
                  size: Constants.kPaddingL,
                  color: Theme.of(context).primaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

extension GenderExtension on Gender? {
  String? string() {
    return this == Gender.male
        ? 'male'
        : this == Gender.female
            ? 'female'
            : null;
  }

  String? stringInt() {
    return this == Gender.male
        ? '1'
        : this == Gender.female
            ? '2'
            : null;
  }
}

extension StringGenderExtension on String {
  Gender toGender() {
    return this == 'male' ? Gender.male : Gender.female;
  }
}
