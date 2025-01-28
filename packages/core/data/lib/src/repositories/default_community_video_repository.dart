import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultCommunityVideoRepository extends CommunityVideoRepository {
  DefaultCommunityVideoRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<CommunityVideoModel> getCommunityVideoById({required int videoId, int? viewCount}) async{
    return remoteDataSourceCall(
        () => _api.getCommunityVideoById(videoId: videoId, viewCount: viewCount).then((value) => value.toDomainModel())
    );
  }

  @override
  Future<List<CommunityVideoModel>> getCommunityVideos(
      {
        required int isPublished,
        required int page,
      required int limit,
      required String type,
      String? search}) async {
    return remoteDataSourceCall(
      () => _api.getCommunityVideos(
        isPublished: isPublished,
        page: page,
        limit: limit,
        type: type,
        search: search,
      ),
    ).then((value) => value.map((e) => e.toDomainModel()).toList());
  }

  @override
  Future<List<CommunityVideoModel>> getRelatedCommunityVideos({required int videoId, required String type, required int limit, required int isPublished}) {
    return remoteDataSourceCall(
          () => _api.getRelatedCommunityVideos(
        id: videoId,
        limit: limit,
        type: type,
            isPublished: isPublished
      ),
    ).then((value) => value.map((e) => e.toDomainModel()).toList());
  }
}
