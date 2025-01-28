import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:preferences/preferences.dart';

import 'models/models.dart';

class HiveBoxKey {
  const HiveBoxKey._();

  static const userDataBoxKey = 'userData';

  static const authStateKey = 'authState';
  static const languageKey = 'languageCode';

  static const accessTokenKey = "accessToken";
  static const refreshTokenKey = "refreshToken";
  static const tokenExpirationTimeKey = "tokenExpirationTime";
  static const tokenTypeKey = "tokenType";
  static const emailKey = "email";
  static const userKey = 'user';
  static const fcmTokenKey = "fcmToken";
}

class HivePreferencesDataSource extends PreferencesDataSource {
  HivePreferencesDataSource._({
    required this.hive,
  }) {
    try {
      hive
        ..registerAdapter(AuthStatePreferenceAdapter())
        ..registerAdapter(LanguagePreferenceAdapter())
        ..registerAdapter(CollegePreferenceAdapter())
        ..registerAdapter(EducationYearPreferenceAdapter())
        ..registerAdapter(GenderPreferenceAdapter())
        ..registerAdapter(ImageUrlPreferenceAdapter())
        ..registerAdapter(OtpChannelPreferenceAdapter())
        ..registerAdapter(UserTypePreferenceAdapter())
        ..registerAdapter(UserRoleCodePreferenceAdapter())
        ..registerAdapter(UserPreferenceAdapter());
    } catch (_) {
      throw Exception(
          'We shouldn\'t have more than one [HivePreferencesDataSource] instance in the '
          'project');
    }
  }

  final HiveInterface hive;

  static Future<HivePreferencesDataSource> create({
    required Future<void> Function(HiveInterface) init,
  }) async {
    final hive = Hive;
    await init(hive);
    final dataSource = HivePreferencesDataSource._(
      hive: hive,
    );
    return dataSource;
  }

  @override
  Future<AuthState> getAuthState() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final AuthStatePreference? authStatePreference = userDataBox.get(
        HiveBoxKey.authStateKey,
        defaultValue: AuthStatePreference.loggedOut);
    return authStatePreference?.toDomainModel() ?? AuthState.loggedOut;
  }

  @override
  Stream<AuthState> observeAuthState() async* {
    yield await getAuthState();

    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final authStateStream = userDataBox.watch(key: HiveBoxKey.authStateKey).map(
      (event) {
        final value = event.value as AuthStatePreference? ??
            AuthStatePreference.loggedOut;
        return value.toDomainModel();
      },
    );
    yield* authStateStream;
  }

  @override
  Future<void> putAuthState(AuthState authState) async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    await userDataBox.put(HiveBoxKey.authStateKey,
        AuthStatePreference.fromDomainModel(authState));
  }

  Future<Box<T>> _openHiveBox<T>(String boxKey) async {
    return hive.openBox(boxKey);
  }

  void clearAll() {
    hive.deleteFromDisk();
  }

  @override
  Future<String> get languageCodeOrDefault async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final LanguagePreference? languagePreference =
        userDataBox.get(HiveBoxKey.languageKey);
    final language = languagePreference?.toDomainModel() ?? Language.en;
    return language.code;
  }

  @override
  Future<Language?> getLanguage() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final LanguagePreference? languagePreference =
        userDataBox.get(HiveBoxKey.languageKey);
    return languagePreference?.toDomainModel();
  }

  @override
  Stream<Language?> observeLanguage() async* {
    yield await getLanguage();

    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final languageStream = userDataBox.watch(key: HiveBoxKey.languageKey).map(
      (event) {
        final value = event.value as LanguagePreference?;
        return value?.toDomainModel();
      },
    );
    yield* languageStream;
  }

  @override
  Future<void> putLanguage(Language language) async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    await userDataBox.put(
        HiveBoxKey.languageKey, LanguagePreference.fromDomainModel(language));
  }

  @override
  Future<String?> getAccessToken() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    return userDataBox.get(HiveBoxKey.accessTokenKey);
  }

  @override
  Future<void> putAccessToken(String accessToken) async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    await userDataBox.put(HiveBoxKey.accessTokenKey, accessToken);
  }

  @override
  Future<void> putRefreshToken(String refreshToken) async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    await userDataBox.put(HiveBoxKey.refreshTokenKey, refreshToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    return userDataBox.get(HiveBoxKey.refreshTokenKey);
  }

  @override
  Stream<String?> observeEmail() async* {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final emailStream = userDataBox.watch(key: HiveBoxKey.emailKey).map(
      (event) {
        final value = event.value as String?;
        return value;
      },
    );
    yield* emailStream;
  }

  @override
  Future<void> putEmail(String email) async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    await userDataBox.put(HiveBoxKey.emailKey, email);
  }

  @override
  Future<User?> getUser() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final UserPreference? userPreference = userDataBox.get(HiveBoxKey.userKey);
    return userPreference?.toDomainModel();
  }

  @override
  Future<void> putUser(User user) async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final userPref = UserPreference.fromDomainModel(user);
    await userDataBox.put(HiveBoxKey.userKey, userPref);
  }

  @override
  Stream<User?> observeUser() async* {
    yield await getUser();

    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    final userStream = userDataBox.watch(key: HiveBoxKey.userKey).map(
      (event) {
        final value = event.value as UserPreference?;
        return value?.toDomainModel();
      },
    );
    yield* userStream;
  }

  @override
  Future<String> get userIdOrThrow async {
    final userId = await getUser().then((value) => value?.id);
    if (userId == null || userId.isEmpty) {
      // Note: this should never happen, but just in case
      logger.d('Unauthorized: Required logged in user.');
      throw const UnknownDomainException(
          'Unauthorized: Required logged in user.');
    }

    return userId;
  }

  @override
  Future<void> clearUser() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.userDataBoxKey);
    await userDataBox.delete(HiveBoxKey.userKey);
  }

  @override
  Future<void> clearFcmToken() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.fcmTokenKey);
    await userDataBox.delete(HiveBoxKey.fcmTokenKey);
  }

  @override
  Future<String> getFcmToken() async {
    final userDataBox = await _openHiveBox(HiveBoxKey.fcmTokenKey);
    return userDataBox.get(HiveBoxKey.fcmTokenKey) ?? '';
  }

  @override
  Future<void> putFcmToken(String fcmToken) async {
    final userDataBox = await _openHiveBox(HiveBoxKey.fcmTokenKey);
    await userDataBox.put(HiveBoxKey.fcmTokenKey, fcmToken);
  }
}
