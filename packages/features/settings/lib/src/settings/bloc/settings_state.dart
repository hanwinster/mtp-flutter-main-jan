part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.language,
  });

  final Language? language;

  factory SettingsState.create() {
    return const SettingsState();
  }

  @override
  List<Object?> get props => [language];

  SettingsState copyWith({
    Language? language,
  }) {
    return SettingsState(
      language: language ?? this.language,
    );
  }
}
