import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:open_store/open_store.dart';
import 'package:ui/ui.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
      {ObserveAuthStateUseCase? observeAuthStateUseCase,
      ObserveUserLanguageUseCase? observeUserLanguageUseCase,
      ObserveLoggedInUserUseCase? observeLoggedInUserUseCase,
      UserDataRepository? userDataRepository,
      ConnectivityPlusNetworkMonitor? networkMonitor,
      LogOutUseCase? logOutUseCase,
      DeactivateUseCase? deactivateUseCase,
      SaveLanguageUseCase? saveLanguageUseCase,
      UnsubscribeUseCase? unsubscribeUseCase,
      GetCmsMenusUseCase? getCmsMenusUseCase,
      GetCurrentVersionUseCase? getCurrentVersionUseCase})
      : _observeAuthStateUseCase = observeAuthStateUseCase ?? getIt(),
        _observeUserLanguageUseCase = observeUserLanguageUseCase ?? getIt(),
        _observeLoggedInUserUseCase = observeLoggedInUserUseCase ?? getIt(),
        _logOutUseCase = logOutUseCase ?? getIt(),
        _deactivateUseCase = deactivateUseCase ?? getIt(),
        _saveLanguageUseCase = saveLanguageUseCase ?? getIt(),
        _unsubscribeUseCase = unsubscribeUseCase ?? getIt(),
        _getCmsMenusUseCase = getCmsMenusUseCase ?? getIt(),
        _getCurrentVersionUseCase = getCurrentVersionUseCase ?? getIt(),
        _networkMonitor = ConnectivityPlusNetworkMonitor(),
        super(AppState.create()) {
    on<AppLanguageFetched>(
      _handleLanguageFetched,
      transformer: restartable(),
    );
    on<AppAuthStateFetched>(
      _handleAuthStateFetched,
      transformer: restartable(),
    );
    on<AppUserFetched>(
      _handleUserFetched,
      transformer: restartable(),
    );
    on<AppLanguageChanged>(_handleLanguageChanged);
    on<AppLogoutRequested>(_handleLogoutRequested);
    on<AppDeactivateRequested>(_handleDeactivateRequested);
    on<AppNetworkStatusChanged>(_handleNetworkStatusChanged);
    on<AppCmsMenusFetched>(_handleCmsMenusFetched);
    _networkMonitorSubscription = _networkMonitor.isOnline.listen((isOnline) {
      add(AppNetworkStatusChanged(isOnline));
    });
    on<AppUnsubscribed>(_handleUnsubscribed);
    on<AppVersionCheck>(_handleAppVersionFetched);
  }

  final ObserveAuthStateUseCase _observeAuthStateUseCase;
  final ObserveUserLanguageUseCase _observeUserLanguageUseCase;
  final ObserveLoggedInUserUseCase _observeLoggedInUserUseCase;
  final LogOutUseCase _logOutUseCase;
  final DeactivateUseCase _deactivateUseCase;
  final SaveLanguageUseCase _saveLanguageUseCase;
  final UnsubscribeUseCase _unsubscribeUseCase;
  final ConnectivityPlusNetworkMonitor _networkMonitor;
  final GetCmsMenusUseCase _getCmsMenusUseCase;
  final GetCurrentVersionUseCase _getCurrentVersionUseCase;
  late StreamSubscription<bool> _networkMonitorSubscription;
  late StreamSubscription<bool> _isFirstTimeSyncCompletedSubscription;

  FutureOr<void> _handleAuthStateFetched(
    AppAuthStateFetched event,
    Emitter<AppState> emit,
  ) async {
    await emit.forEach(
      _observeAuthStateUseCase(),
      onData: (authState) {
        return state.copyWith(authState: authState);
      },
      onError: (e, s) {
        logger.e('Error fetching auth state', e, s);
        return state;
      },
    );
  }

  FutureOr<void> _handleLanguageFetched(
    AppLanguageFetched event,
    Emitter<AppState> emit,
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

  FutureOr<void> _handleUserFetched(
    AppUserFetched event,
    Emitter<AppState> emit,
  ) async {
    await emit.forEach(
      _observeLoggedInUserUseCase(),
      onData: (result) {
        return state.copyWith(loggedInUser: result.dataOrNull);
      },
      onError: (e, s) {
        logger.e('Error fetching user', e, s);
        return state;
      },
    );
  }

  FutureOr<void> _handleLanguageChanged(
    AppLanguageChanged event,
    Emitter<AppState> emit,
  ) async {
    await _saveLanguageUseCase(event.language);
    add(AppCmsMenusFetched());
  }

  FutureOr<void> _handleNetworkStatusChanged(
    AppNetworkStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(isOnline: event.isOnline));
  }

  @override
  Future<void> close() {
    _isFirstTimeSyncCompletedSubscription.cancel();
    _networkMonitorSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _handleLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    try {
      await _logOutUseCase();
    } catch (e, s) {
      logger.e('Error logging out', e, s);
    }
  }

  Future<void> _handleDeactivateRequested(
      AppDeactivateRequested event, Emitter<AppState> emit) async {
    try {
      await _deactivateUseCase();
    } catch (e, s) {
      logger.e('Error deactivating account', e, s);
    }
  }

  Future<void> _handleUnsubscribed(
    AppUnsubscribed event,
    Emitter<AppState> emit,
  ) async {
    emit(
      state.copyWith(unsubscribeSubmissionUiState: const UiStateInProgress()),
    );
    try {
      final message = await _unsubscribeUseCase();
      emit(
        state.copyWith(
          unsubscribeSubmissionUiState: UiStateSuccess(message),
        ),
      );
    } catch (e, s) {
      logger.e('Error unsubscribing', e, s);
      emit(
        state.copyWith(
          unsubscribeSubmissionUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _handleCmsMenusFetched(
    AppCmsMenusFetched event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(cmsMenusUiState: const UiStateInProgress()));
    try {
      final menus = await _getCmsMenusUseCase();
      emit(state.copyWith(cmsMenusUiState: UiStateSuccess(menus)));
    } catch (e, s) {
      logger.e('Error fetching cms menus', e, s);
      emit(state.copyWith(cmsMenusUiState: UiStateFailure.fromError(e)));
    }
  }

  Future<void> _handleAppVersionFetched(
    AppVersionCheck event,
    Emitter<AppState> emit,
  ) async {
    try {
      var result = await _getCurrentVersionUseCase();
      final needsUpdate = await _needsUpdate(result);
      if (needsUpdate) {
        showDialog(
          context: event.context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title:
                Text(context.l10n.updateTitle, style: TextStyle(fontSize: 18)),
            content: Text(
                context.l10n.updateversionAvailable(result.versionCode),
                style: TextStyle(fontSize: 16)),
            actions: [
              TextButton(
                child: Text(context.l10n.courseButtonTextCancelCourseConfirm),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(context.l10n.btnUpdate),
                onPressed: () {
                  Navigator.pop(context);
                  // final androidPackageName = await getAndroidPackageName();
                  final androidPackageName = 'com.misfit.mtp';
                  OpenStore.instance.open(
                    appStoreId: iosAppStoreId,
                    androidAppBundleId: androidPackageName,
                  );
                },
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: event.context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.alert, style: TextStyle(fontSize: 18)),
            content: Text(context.l10n.versionalreadyupdated,
                style: TextStyle(fontSize: 16)),
            actions: [
              TextButton(
                child: Text(context.l10n.courseButtonTextCancelCourseConfirm),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }
    } catch (e, s) {
      logger.e('Error checking version', e, s);
    }
  }

  Future<bool> _needsUpdate(Version serverVersion) async {
    final currentVersion = await getAppVersion();
    return serverVersion.versionCode.compareTo(currentVersion) > 0;
  }
}
