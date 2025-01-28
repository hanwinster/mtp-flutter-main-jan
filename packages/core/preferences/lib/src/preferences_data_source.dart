import 'dart:async';

import 'package:domain/domain.dart';

abstract class PreferencesDataSource {
  Stream<AuthState> observeAuthState();

  Future<AuthState> getAuthState();

  Future<void> putAuthState(AuthState authState);

  Future<void> putLanguage(Language language);

  Future<void> putEmail(String email);

  Stream<String?> observeEmail();

  Future<String> get languageCodeOrDefault;

  Future<Language?> getLanguage();

  Stream<Language?> observeLanguage();

  Future<void> putAccessToken(String accessToken);

  Future<String?> getAccessToken();

  Future<void> putRefreshToken(String refreshToken);

  Future<String?> getRefreshToken();

  Future<void> putUser(User user);

  Future<User?> getUser();

  Future<String> get userIdOrThrow;

  Stream<User?> observeUser();

  Future<void> clearUser();

  Future<void> putFcmToken(String fcmToken);

  Future<String?> getFcmToken();

  Future<void> clearFcmToken();
}
