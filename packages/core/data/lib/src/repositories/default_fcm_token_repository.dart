import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultFcmTokenRepository extends FcmTokenRepository {
  DefaultFcmTokenRepository({
    PreferencesDataSource? preferencesDataSource,
    MtpApi? api,
  })  : _api = api ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _preferencesDataSource;


  @override
  Future<FcmTokenUpdateResponse> setFcmToken({required String token}) async {
    final result = await remoteDataSourceCall(
          () => _api.updateFcmToken(token: token),
    );
    return result.toDomainModel();
  }


}
