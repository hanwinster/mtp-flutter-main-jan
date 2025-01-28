import 'dart:io';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

class DefaultThematicGroupRepository extends ThematicGroupRepository {
  DefaultThematicGroupRepository({
    MtpApi? api,
    PreferencesDataSource? preferencesDataSource,
  })  : _api = api ?? getIt(),
        _preferencesDataSource = preferencesDataSource ?? getIt();

  final MtpApi _api;
  final PreferencesDataSource _preferencesDataSource;

  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Future<List<ThematicGroupListing>> getUserGroups({
    required int page,
    required int pageSize,
    required String keyword,
    required List<String> categories,
  }) async {
    final response = await remoteDataSourceCall(
      () => _api.getUserGroups(
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        categories: categories.join(','),
      ),
    );
    return response.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<List<ThematicGroupListing>> getRecommendGroups({
    required int page,
    required int pageSize,
    required String keyword,
    required List<String> categories,
  }) async {
    final response = await remoteDataSourceCall(
      () => _api.getRecommendedGroups(
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        categories: categories.join(','),
      ),
    );
    return response.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<ThematicGroupListing> getGroup({
    required String groupId,
  }) async {
    final response = await remoteDataSourceCall(
      () => _api.getGroup(groupId: groupId),
    );
    return response.toDomainModel();
  }

  @override
  Future<ThematicGroupRequestResponse> requestJoinGroup({
    required String groupId,
    required bool isApproved,
  }) async {
    User? user = await _preferencesDataSource.getUser();
    if (user == null) {
      throw Exception('Login required');
    }

    final result = await remoteDataSourceCall(
      () => _api.requestToJoinGroup(
          group_id: groupId,
          user_id: user.id,
          approval_status: isApproved ? 1 : 0),
    );
    return result.toDomainModel();
  }

  @override
  Stream<Result<List<ThematicGroupPost>>> observeGroupPost(
      {int? page, int? pageSize, required String group_id}) async* {
    try {
      final response = await remoteDataSourceCall(
        () => _api.getPostsList(
            page: page, pageSize: pageSize, group_id: group_id),
      );
      yield ResultSuccess(response.map((e) => e.toDomainModel()).toList());
    } on Exception catch (e) {
      yield ResultError(e);
    }
  }

  @override
  Future<ThematicGroupPostCreateResponse> createPost({
    required String groupId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.createPost(
        group_id: groupId,
        description: description,
        uploadedFile: uploadedFile,
        uploadedVideo: uploadedVideo,
      ),
    );
    return result.toDomainModel();
  }

  @override
  Future<void> editPost({
    required String post_id,
    required String group_id,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    await remoteDataSourceCall(
      () => _api.editPost(
        post_id: post_id,
        group_id: group_id,
        description: description,
        uploadedFile: uploadedFile,
        uploadedVideo: uploadedVideo,
      ),
    );
  }

  @override
  Future<ThematicGroupRulesResponse> getGroupRules() async {
    final result = await remoteDataSourceCall(
      () => _api.getGroupRules(),
    );
    return result.toDomainModel();
  }

  @override
  Future<List<ThematicGroupCategory>> getCategories() async {
    final result = await remoteDataSourceCall(
      () => _api.getCategories(),
    );
    return result.map((e) => e.toDomainModel()).toList();
  }

  @override
  Future<Result<ThematicGroupPostCreateResponse>> deletePost({
    required String postId,
  }) async {
    try {
      final result = await remoteDataSourceCall(
        () => _api.deleteGroupPost(postId: postId.toIntOrThrow()),
      );
      return ResultSuccess(result.toDomainModel());
    } on Exception catch (e) {
      // Handle the exception and return it as a ResultError
      return ResultError(e);
    }
  }

  @override
  Future<String> leaveGroup({
    required String groupId,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.leaveGroup(groupId: groupId.toIntOrNull()!),
    );
    return result;
  }

  @override
  Future<Reaction> createReaction({
    required ThematicGroupReactionToType reactionToType,
    required ReactionType reaction,
    required String reactionToId,
    required String groupId,
  }) async {
    final result =
        await remoteDataSourceCall(() => _api.createThematicGroupReaction(
              reactionType: ReactionTypeRM.fromDomainModel(reaction),
              reactionToType:
                  ThematicGroupReactionToTypeRM.fromDomainModel(reactionToType)
                      .toJson(),
              reactionToId: reactionToId.toIntOrThrow(),
              groupId: groupId.toIntOrThrow(),
            ));
    return result.toDomainModel();
  }

  @override
  Future<void> deleteReaction({
    required String reactionId,
  }) async {
    await remoteDataSourceCall(
      () => _api.deleteThematicGroupReaction(
          reactionId: reactionId.toIntOrThrow()),
    );
  }

  @override
  Future<Reaction> updateReaction({
    required String reactionId,
    required ReactionType reaction,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.updateThematicGroupReaction(
        reactionId: reactionId.toIntOrThrow(),
        reactionType: ReactionTypeRM.fromDomainModel(reaction),
      ),
    );
    return result.toDomainModel();
  }
}
