import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class _keys {
  static const String theme = 'app-theme';
  static const String locale = 'app-locale';
}

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme
  ThemeMode getTheme() {
    final value = _prefs.getString(_keys.theme);
    return ThemeMode.values.firstWhere(
        (e) => e.toString().toLowerCase() == '$value'.toLowerCase(),
        orElse: () => ThemeMode.light);
  }

  void setTheme(ThemeMode value) {
    _prefs.setString(_keys.theme, value.toString().toLowerCase());
  }

  // locale
  Locale? getLocale() {
    final value = _prefs.getString(_keys.locale);

    if (value == null) {
      return null;
    } else {
      return Locale(value);
    }
  }

  void setLocale(Locale value) {
    _prefs.setString(_keys.locale, value.languageCode);
  }
}
