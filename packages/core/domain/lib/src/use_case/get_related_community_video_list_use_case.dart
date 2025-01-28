import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetRelatedCommunityVideoListUseCase {
  final CommunityVideoRepository _communityVideoRepository;

  GetRelatedCommunityVideoListUseCase({CommunityVideoRepository? communityVideoRepository})
      : _communityVideoRepository = communityVideoRepository ?? getIt();

  Future<List<CommunityVideoModel>> call({required int videoId, required int limit, required String type, String? search, required int isPublished}) {
    return _communityVideoRepository.getRelatedCommunityVideos(videoId: videoId, limit: limit, type: type, isPublished: isPublished);
  }
}
