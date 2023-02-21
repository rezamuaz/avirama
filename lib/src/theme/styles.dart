import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class XStyles {
  static final title = TextStyle(
    fontSize: Constants.kFontSizeL,
    color: XColors.text,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.lato().fontFamily,
  );

  static final TextStyle headline1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40,
    fontFamily: GoogleFonts.manrope().fontFamily,
  );
  static final TextStyle headline2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    fontFamily: GoogleFonts.manrope().fontFamily,
  );
  static final TextStyle headline3 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Constants.kFontSizeX,
    fontFamily: GoogleFonts.manrope().fontFamily,
  );
  static final TextStyle headline4 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Constants.kFontSizeL,
    fontFamily: GoogleFonts.manrope().fontFamily,
  );
  static final TextStyle headline5 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Constants.kFontSizeL,
    fontFamily: GoogleFonts.manrope().fontFamily,
  );
  static final TextStyle headline6 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    fontFamily: GoogleFonts.manrope().fontFamily,
  );

  static final TextStyle bodyText1 = TextStyle(
    fontSize: Constants.kFontSizeL,
    fontWeight: FontWeight.normal,
    color: XColors.grey_80,
    fontFamily: GoogleFonts.lato().fontFamily,
  );

  static final TextStyle bodyText2 = TextStyle(
    fontSize: Constants.kFontSizeM,
    fontWeight: FontWeight.normal,
    color: XColors.text,
    fontFamily: GoogleFonts.lato().fontFamily,
  );

  static const TextStyle inputStyle = TextStyle(
    fontSize: Constants.kFontSizeM,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle button = TextStyle(
    fontSize: Constants.kFontSizeM,
    fontWeight: FontWeight.bold,
  );

  // https://api.flutter.dev/flutter/material/TextTheme-class.html
  static TextTheme get textTheme {
    final textTheme = TextTheme(
      // Headline
      headline1: headline1,
      headline2: headline2,
      headline3: headline3,
      headline4: headline4,
      headline5: headline5,
      headline6: headline6,

      subtitle1: inputStyle,
      bodyText1: bodyText1,
      bodyText2: bodyText2,
      button: button,
    ).apply(
      bodyColor: XColors.text,
      displayColor: XColors.text,
    );
    return textTheme;
  }
}
