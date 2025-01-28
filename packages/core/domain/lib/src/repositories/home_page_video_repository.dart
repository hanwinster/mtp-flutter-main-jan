import 'package:domain/domain.dart';

abstract class HomePageVideoRepository {
  Future<HomePageVideoModel> getHomePageVideo();
}