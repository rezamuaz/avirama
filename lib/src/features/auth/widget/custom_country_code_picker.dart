import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class XCountryCodePicker extends StatelessWidget {
  const XCountryCodePicker({
    Key? key,
    this.onChange,
    this.enable = true,
    this.initialSelection,
  }) : super(key: key);

  final Function(Country)? onChange;
  final bool enable;
  final String? initialSelection;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
