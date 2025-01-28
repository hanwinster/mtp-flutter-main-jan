import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetHomePageVideoUseCase {
  final HomePageVideoRepository _homePageVideoRepository;

  GetHomePageVideoUseCase({HomePageVideoRepository? homePageVideoRepository})
      : _homePageVideoRepository = homePageVideoRepository ?? getIt();

  Future<HomePageVideoModel> call() {
    return _homePageVideoRepository.getHomePageVideo();
  }
}
