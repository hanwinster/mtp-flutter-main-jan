import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetGroupPendingPostsUseCaseRequest extends Equatable {
  final String groupId;
  final String userId;
  final int page;
  final int limit;

  const GetGroupPendingPostsUseCaseRequest({
    required this.groupId,
    required this.userId,
    required this.page,
    required this.limit,
  });

  @override
  List<Object> get props => [groupId, userId, page, limit];
}

class GetGroupPendingPostsUseCase {
  GetGroupPendingPostsUseCase({
    ThematicGroupPostRepository? repository,
  }) : _repository = repository ?? getIt();

  final ThematicGroupPostRepository _repository;

  Future<List<ThematicGroupPost>> call(
    GetGroupPendingPostsUseCaseRequest request,
  ) async {
    return _repository.getGroupPendingPosts(
      request.groupId,
      request.userId,
      request.page,
      request.limit,
    );
  }
}
