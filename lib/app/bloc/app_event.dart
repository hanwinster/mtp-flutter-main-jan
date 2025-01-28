part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

class AppLanguageFetched extends AppEvent {
  const AppLanguageFetched();

  @override
  List<Object> get props => [];
}

class AppAuthStateFetched extends AppEvent {
  const AppAuthStateFetched();

  @override
  List<Object> get props => [];
}

class AppUserFetched extends AppEvent {
  const AppUserFetched();

  @override
  List<Object> get props => [];
}

class AppLanguageChanged extends AppEvent {
  const AppLanguageChanged(this.language);

  final Language language;

  @override
  List<Object?> get props => [language];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();

  @override
  List<Object> get props => [];
}

class AppDeactivateRequested extends AppEvent {
  const AppDeactivateRequested();

  @override
  List<Object> get props => [];
}

class AppNetworkStatusChanged extends AppEvent {
  const AppNetworkStatusChanged(this.isOnline);

  final bool isOnline;

  @override
  List<Object> get props => [isOnline];
}

class AppScaffoldKeyChanged extends AppEvent {
  const AppScaffoldKeyChanged(this.scaffoldKey);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  List<Object> get props => [scaffoldKey];
}

class AppUnsubscribed extends AppEvent {
  const AppUnsubscribed();

  @override
  List<Object> get props => [];
}

class AppCmsMenusFetched extends AppEvent {
  const AppCmsMenusFetched();

  @override
  List<Object> get props => [];
}

class AppVersionCheck extends AppEvent {
  final BuildContext context;
  const AppVersionCheck(this.context);

  @override
  List<Object> get props => [context];
}
