import 'dart:ui';

import 'package:absensi_app/src/core/exception/arstate.dart' as arstate;
import 'package:timeago/timeago.dart' as timeago;
import '../services/user_prefs.dart';

import '../features/common/setting/setting_bloc.dart';

Locale? localeResolutionCallback(
  Locale? userLocale,
  Iterable<Locale> supportedLocales,
  SettingState state,
) {
  late Locale localeResult;

  for (var locale in supportedLocales) {
    if (locale.languageCode == userLocale?.languageCode) {
      if (state.locale == null) {
        UserPrefs.instance.setLocale(locale);
      }

      localeResult = userLocale!;
    } else {
      localeResult = supportedLocales.first;
    }
  }

  arstate.setDefaultLocale(localeResult.languageCode);
  timeago.setDefaultLocale(localeResult.languageCode);

  return localeResult;
}
