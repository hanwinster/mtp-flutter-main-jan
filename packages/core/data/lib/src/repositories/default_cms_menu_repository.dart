import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultCmsMenuRepository extends CmsMenuRepository {
  DefaultCmsMenuRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<List<CmsMenu>> getCmsMenus() async {
    final result = await remoteDataSourceCall(
      () => _api.getCmsMenus(),
    );
    return result.map((e) => e.toDomainModel()).toList();
  }
}
