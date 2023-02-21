import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'styles.dart';

class XTheme {
  static final String? fontFamily = GoogleFonts.lato().fontFamily;
  static const barOverLayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  );

  static ThemeData light() => ThemeData(
        fontFamily: fontFamily,

        /// Colors
        primarySwatch: XAppColors.primaryColors,
        primaryColor: XAppColors.primary,
        brightness: Brightness.light,
        textTheme: XStyles.textTheme,

        // ColorScheme
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: XAppColors.primaryLight,
          primary: XAppColors.primary,
        ),

        // FloatingActionButton
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 1.0,
        ),

        // Appbar
        appBarTheme: const AppBarTheme(
          titleSpacing: 0,
          shape: Border(
            bottom: BorderSide(color: XColors.grey_20, width: 2),
          ),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: barOverLayStyle,
          foregroundColor: XAppColors.primary,
          backgroundColor: XColors.white,
        ),

        /// input
        inputDecorationTheme: InputDecorationTheme(
          errorMaxLines: 3,
          filled: true,
          hintStyle: const TextStyle(color: XColors.grey_60),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Constants.kPaddingL,
          ),
          fillColor: XColors.grey_20,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.kRadiusM),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.kRadiusM),
            borderSide: const BorderSide(
              color: XAppColors.primary,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.kRadiusM),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.kRadiusM),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.kRadiusM),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),

        /// Button
        buttonTheme: const ButtonThemeData(
          height: 48,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Constants.kRadiusM),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: XAppColors.primary),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: XAppColors.primary),
              borderRadius: BorderRadius.circular(Constants.kRadiusM),
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        ),
        iconTheme: const IconThemeData(),
      );

  static ThemeData dark() => ThemeData.dark();
}
