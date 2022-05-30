import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hw/components/locale/locals.dart';

class SettingsState extends Equatable {
  //в таком случае надо бы переделать на мапу, но времени несколько часов
  final Locale? locale;

  const SettingsState({this.locale});

  SettingsState copyWith({
    Locale? newLocale,
  }) =>
      SettingsState(locale: newLocale ?? locale);

  @override
  List<Object> get props => [locale ?? availableLocales[enLocale]!];
}
