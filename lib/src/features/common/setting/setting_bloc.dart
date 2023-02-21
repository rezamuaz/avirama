import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/user_prefs.dart';

part 'setting_state.dart';

class SettingBloc extends Cubit<SettingState> {
  SettingBloc()
      : super(SettingState(
          themeMode: UserPrefs.instance.getTheme(),
          locale: UserPrefs.instance.getLocale(),
        ));

  void onChangeTheme(ThemeMode? mode) {
    if (mode != null) {
      emit(state.copyWith(themeMode: mode));
      UserPrefs.instance.setTheme(mode);
    }
  }

  void onChangeLang(Locale? locale) {
    if (locale != null) {
      emit(state.copyWith(locale: locale));
      UserPrefs.instance.setLocale(locale);
    }
  }
}
