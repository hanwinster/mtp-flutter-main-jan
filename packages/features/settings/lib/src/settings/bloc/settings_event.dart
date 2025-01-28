part of 'settings_bloc.dart';

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsLanguageFetched extends SettingsEvent {
  const SettingsLanguageFetched();

  @override
  List<Object> get props => [];
}

class SettingsLanguageChanged extends SettingsEvent {
  const SettingsLanguageChanged(this.language);

  final Language language;

  @override
  List<Object> get props => [language];
}
