import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultThematicGroupPostRepository extends ThematicGroupPostRepository {
  DefaultThematicGroupPostRepository({
    MtpApi? api,
    PreferencesDataSource? prefs,
    BlogPostCategoryDao? blogPostCategoryDao,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<PagedList<ThematicGroupPost>> getGroupApprovedPosts(
    String groupId,
    String userId,
    int page,
    int limit,
  ) async {
    final result = await remoteDataSourceCall(
      () => _api.getGroupApprovedPosts(
        groupId: groupId.toIntOrThrow(),
        userId: userId.toIntOrThrow(),
        page: page,
        limit: limit,
      ),
    );
    return PagedList(
      total: result.pagination?.total ?? 0,
      items: result.data.map((e) => e.toDomainModel()).toList(),
    );
  }

  @override
  Future<List<ThematicGroupPost>> getGroupPendingPosts(
    String groupId,
    String userId,
    int page,
    int limit,
  ) async {
    final result = await remoteDataSourceCall(
      () => _api.getGroupPendingPosts(
        groupId: groupId.toIntOrThrow(),
        userId: userId.toIntOrThrow(),
        page: page,
        limit: limit,
      ),
    );
    return result.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<ThematicGroupPost> getGroupPost({
    required String postId,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.getGroupPost(
        postId: postId.toIntOrThrow(),
      ),
    );
    return result.toDomainModel();
  }
}
