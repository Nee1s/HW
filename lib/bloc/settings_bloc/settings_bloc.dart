import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings_bloc_event.dart';
import 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(locale: Locale('ru', 'RU'))) {
    on<SaveSettingEvent>(_onSaveName);
    on<LoadSettingEvent>(_onLoadName);
  }

  void _onLoadName(LoadSettingEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final String? localeFromPreference = prefs.getString(event.nameSetting);
    emit(state.copyWith(
        newLocale: localeFromPreference == 'en_US'
            ? const Locale('en', 'US')
            : const Locale('ru', 'RU')));
  }

  void _onSaveName(SaveSettingEvent event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(event.settingName, event.setting);
    emit(state.copyWith(
        newLocale: event.setting == 'en_US'
            ? const Locale('en', 'US')
            : const Locale('ru', 'RU')));
  }
}
