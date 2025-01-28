import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../util/network_bound_result.dart';

class DefaultUserDataRepository extends UserDataRepository {
  DefaultUserDataRepository({
    MtpApi? api,
    PreferencesDataSource? preferencesDataSource,
  }) :
        _api = api ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _preferencesDataSource;

  @override
  Future<Language?> getLanguage() => _preferencesDataSource.getLanguage();

  @override
  Stream<Language?> observeLanguage() =>
      _preferencesDataSource.observeLanguage();

  @override
  Future<void> saveLanguage(Language language) async {
    _preferencesDataSource.putLanguage(language);
  }

  @override
  Stream<Result<User?>> observeLoggedInUser() async* {
    final authState = await _preferencesDataSource.getAuthState();
    final result = NetworkBoundResult<User?, UserRM>(
      createCall: () => remoteDataSourceCall(
            () => _api.getMe(),
      ),
      saveCallResult: (entity) async {
        await _preferencesDataSource.putUser(entity.toDomainModel());
      },
      loadFromDb: () => _preferencesDataSource.observeUser(),
      shouldFetch: (data) {
        return authState == AuthState.loggedIn;
      },
      onFetchFailed: () async {
        // no-op
      },
    );

    yield* result.asStream();
  }
}
