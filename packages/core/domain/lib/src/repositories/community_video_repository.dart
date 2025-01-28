import 'package:domain/domain.dart';

abstract class CommunityVideoRepository {
  Future<List<CommunityVideoModel>> getCommunityVideos({
    required int isPublished,
    required int page,
    required int limit,
    required String type,
    String? search,
  });

  Future<List<CommunityVideoModel>> getRelatedCommunityVideos({
    required int videoId,
    required String type,
    required int limit,
    required int isPublished
  });

  Future<CommunityVideoModel> getCommunityVideoById({
    required int videoId,
    int? viewCount,
  });
}
