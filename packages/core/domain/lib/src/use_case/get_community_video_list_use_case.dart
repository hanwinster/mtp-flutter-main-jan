import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CommunityVideoListUseCase {
  final CommunityVideoRepository _communityVideoRepository;

  CommunityVideoListUseCase({CommunityVideoRepository? communityVideoRepository})
      : _communityVideoRepository = communityVideoRepository ?? getIt();

  Future<List<CommunityVideoModel>> call({required int isPublished, required int page, required int limit, required String type, String? search}) {
    return _communityVideoRepository.getCommunityVideos(isPublished: isPublished, page: page, limit: limit, type: type, search: search);
  }
}
