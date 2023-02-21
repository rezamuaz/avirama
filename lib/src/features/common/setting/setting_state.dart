part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final ThemeMode themeMode;
  final Locale? locale;

  const SettingState({
    this.themeMode = ThemeMode.system,
    this.locale,
  });

  @override
  List<Object?> get props => [themeMode, locale];

  SettingState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
