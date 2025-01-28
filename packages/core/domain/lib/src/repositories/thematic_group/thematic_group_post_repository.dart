import 'package:domain/domain.dart';

abstract class ThematicGroupPostRepository {
  Future<PagedList<ThematicGroupPost>> getGroupApprovedPosts(
    String groupId,
    String userId,
    int page,
    int limit,
  );

  Future<List<ThematicGroupPost>> getGroupPendingPosts(
    String groupId,
    String userId,
    int page,
    int limit,
  );

  Future<ThematicGroupPost> getGroupPost({
    required String postId,
  });
}
