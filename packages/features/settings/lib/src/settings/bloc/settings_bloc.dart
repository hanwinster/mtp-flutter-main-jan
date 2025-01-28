import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    ObserveUserLanguageUseCase? observeUserLanguageUseCase,
    SaveLanguageUseCase? saveLanguageUseCase,
  })  : _observeUserLanguageUseCase = observeUserLanguageUseCase ?? getIt(),
        _saveLanguageUseCase = saveLanguageUseCase ?? getIt(),
        super(SettingsState.create()) {
    on<SettingsLanguageFetched>(_handleLanguageFetched,
        transformer: restartable());
    on<SettingsLanguageChanged>(_handleLanguageChanged);
  }

  final SaveLanguageUseCase _saveLanguageUseCase;
  final ObserveUserLanguageUseCase _observeUserLanguageUseCase;

  FutureOr<void> _handleLanguageFetched(
    SettingsLanguageFetched event,
    Emitter<SettingsState> emit,
  ) async {
    await emit.forEach(
      _observeUserLanguageUseCase(),
      onData: (language) {
        return state.copyWith(language: language);
      },
      onError: (e, s) {
        logger.e('Error fetching language', e, s);
        return state;
      },
    );
  }

  FutureOr<void> _handleLanguageChanged(
    SettingsLanguageChanged event,
    Emitter<SettingsState> emit,
  ) async {
    await _saveLanguageUseCase(event.language);
  }
}
