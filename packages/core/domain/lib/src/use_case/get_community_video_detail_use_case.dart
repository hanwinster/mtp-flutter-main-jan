import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CommunityVideoDetailUseCase {
  final CommunityVideoRepository _communityVideoRepository;

  CommunityVideoDetailUseCase({CommunityVideoRepository? communityVideoRepository})
      : _communityVideoRepository = communityVideoRepository ?? getIt();

  Future<CommunityVideoModel> call({required int videoId, int? viewCount}) {
    return _communityVideoRepository.getCommunityVideoById(videoId: videoId, viewCount : viewCount);
  }
}
