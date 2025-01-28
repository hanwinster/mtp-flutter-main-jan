import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

import '../hive_ids.dart';
part 'auth_state_preference.g.dart';

@HiveType(typeId: HiveTypeId.authStatePreference)
enum AuthStatePreference {
  @HiveField(0)
  loggedIn,
  @HiveField(1)
  loggedOut;

  static AuthStatePreference fromDomainModel(AuthState authState) {
    switch (authState) {
      case AuthState.loggedIn:
        return AuthStatePreference.loggedIn;
      case AuthState.loggedOut:
        return AuthStatePreference.loggedOut;
    }
  }
}

extension AuthStatePreferenceX on AuthStatePreference {
  AuthState toDomainModel() {
    switch (this) {
      case AuthStatePreference.loggedIn:
        return AuthState.loggedIn;
      case AuthStatePreference.loggedOut:
        return AuthState.loggedOut;
    }
  }
}
