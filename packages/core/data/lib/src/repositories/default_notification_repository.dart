import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultNotificationRepository extends NotificationRepository {
  DefaultNotificationRepository({
    PreferencesDataSource? preferencesDataSource,
    MtpApi? api,
  })  : _api = api ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _preferencesDataSource;

  @override
  Future<NotificationListWithReadCount>
      getNotificationListWithReadCount() async {
    final result = await remoteDataSourceCall(
      () => _api.getNotificationListResponse(),
    );
    return result.toDomainModel();
  }

  @override
  Future<NotificationDetailResponse> getNotificationDetailResponse(
      {required String notiId}) async {
    final result = await remoteDataSourceCall(
      () => _api.getNotificationDetail(notiId: notiId),
    );
    // print("Result of api is : ${jsonEncode(result)}");
    return result.toDomainModel();
  }
}
