import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetGroupApprovedPostsUseCaseRequest extends Equatable {
  final String groupId;
  final String userId;
  final int page;
  final int limit;

  const GetGroupApprovedPostsUseCaseRequest({
    required this.groupId,
    required this.userId,
    required this.page,
    required this.limit,
  });

  @override
  List<Object> get props => [groupId, userId, page, limit];
}

class GetGroupApprovedPostsUseCase {
  GetGroupApprovedPostsUseCase({
    ThematicGroupPostRepository? repository,
  }) : _repository = repository ?? getIt();

  final ThematicGroupPostRepository _repository;

  Future<PagedList<ThematicGroupPost>> call(
    GetGroupApprovedPostsUseCaseRequest request,
  ) async {
    return _repository.getGroupApprovedPosts(
      request.groupId,
      request.userId,
      request.page,
      request.limit,
    );
  }
}
