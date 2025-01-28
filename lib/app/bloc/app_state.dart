part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.language,
    this.authState,
    this.isOnline,
    this.loggedInUser,
    this.cmsMenusUiState = const UiStateInitial(),
    this.unsubscribeSubmissionUiState = const UiStateInitial(),
  });

  final Language? language;
  final AuthState? authState;
  final bool? isOnline;
  final User? loggedInUser;
  final UiState<String> unsubscribeSubmissionUiState;
  final UiState<List<CmsMenu>> cmsMenusUiState;

  factory AppState.create() {
    return const AppState();
  }

  bool get isLoggedIn => authState == AuthState.loggedIn;

  Locale get locale => Locale((language ?? Language.en).code);

  Language get languageOrDefault => language ?? Language.en;

  @override
  List<Object?> get props => [
        language,
        authState,
        isOnline,
        loggedInUser,
        unsubscribeSubmissionUiState,
        cmsMenusUiState,
      ];

  factory AppState.empty() => const AppState();

  AppState copyWith({
    Language? language,
    AuthState? authState,
    bool? isOnline,
    User? loggedInUser,
    bool? isFirstTimeSyncCompleted,
    GlobalKey<ScaffoldState>? currentScaffoldKey,
    UiState<String>? unsubscribeSubmissionUiState,
    UiState<List<CmsMenu>>? cmsMenusUiState,
  }) {
    return AppState(
      language: language ?? this.language,
      authState: authState ?? this.authState,
      isOnline: isOnline ?? this.isOnline,
      loggedInUser: loggedInUser ?? this.loggedInUser,
      unsubscribeSubmissionUiState:
          unsubscribeSubmissionUiState ?? this.unsubscribeSubmissionUiState,
      cmsMenusUiState: cmsMenusUiState ?? this.cmsMenusUiState,
    );
  }
}
