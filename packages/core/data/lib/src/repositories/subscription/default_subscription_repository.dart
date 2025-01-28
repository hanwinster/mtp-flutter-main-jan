import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';


class DefaultSubscriptionRepository extends SubscriptionRepository {
  DefaultSubscriptionRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
  })
      : _api = api ?? getIt(),
        _prefs = prefs ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _prefs;

  @override
  Future<SubscriptionTerm> getSubscriptionTerm() async {
    final response = await remoteDataSourceCall(
          () => _api.getSubscriptionTerm(),
    );
    final language = await _prefs.getLanguage();
    return response.toDomainModel(
      language: language ?? Language.en,
    );
  }

  @override
  Future<String> subscribe() async {
    final response = await remoteDataSourceCall(
          () => _api.subscribe(),
    );
    return response;
  }

  @override
  Future<String> unsubscribe() async {
    final response = await remoteDataSourceCall(
          () => _api.unsubscribe(),
    );
    return response;
  }
}
