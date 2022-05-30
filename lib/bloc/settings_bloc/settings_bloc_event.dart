import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettingEvent extends SettingsEvent {
  final String nameSetting;

  const LoadSettingEvent({required this.nameSetting});

  @override
  List<Object> get props => [nameSetting];
}

class SaveSettingEvent extends SettingsEvent {
  final String settingName;
  final String setting;

  const SaveSettingEvent({
    required this.settingName,
    required this.setting,
  });

  @override
  List<Object> get props => [setting, settingName];
}
