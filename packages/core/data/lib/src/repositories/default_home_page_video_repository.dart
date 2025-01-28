import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultHomePageVideoRepository implements HomePageVideoRepository {

  DefaultHomePageVideoRepository({
    MtpApi? api,
  })  : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<HomePageVideoModel> getHomePageVideo() {
    return remoteDataSourceCall(
          () => _api.getHomePageVideo().then((value) => value.toDomainModel()),
    );
  }
}