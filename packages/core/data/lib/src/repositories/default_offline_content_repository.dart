import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultOfflineContentRepository extends OfflineContentRepository {

  DefaultOfflineContentRepository({
    MtpApi? api,
  })  : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<OfflineContentModel> getOfflineContent() {
    return remoteDataSourceCall(
          () => _api.getOfflineContent().then((value) => value.toDomainModel()),
    );
  }

}