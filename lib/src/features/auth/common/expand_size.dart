import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

double expandedSize(BuildContext context, {double size = 0.06}) {
  double sh = MediaQuery.of(context).size.height;

  double sw = sh * size;
  return sw < Constants.kPaddingXL ? Constants.kPaddingXL : sw;
}
