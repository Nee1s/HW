import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  //в таком случае надо бы переделать на мапу, но времени несколько часов
  final String? locale;

  const SettingsState({this.locale});

  SettingsState copyWith({
    String? newLocale,
  }) =>
      SettingsState(locale: newLocale ?? locale);

  @override
  List<Object> get props => [locale ?? ''];
}
