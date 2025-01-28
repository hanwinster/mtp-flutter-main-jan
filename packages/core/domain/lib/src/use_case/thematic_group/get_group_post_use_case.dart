import 'package:base/base.dart';

import '../../../domain.dart';

class GetGroupPostUseCaseRequest extends Equatable {
  final String postId;

  const GetGroupPostUseCaseRequest({
    required this.postId,
  });

  @override
  List<Object> get props => [postId];
}

class GetGroupPostUseCase {
  final ThematicGroupPostRepository _repository;

  GetGroupPostUseCase({
    ThematicGroupPostRepository? repository,
  }) : _repository = repository ?? getIt();

  Future<ThematicGroupPost> call(GetGroupPostUseCaseRequest request) {
    return _repository.getGroupPost(
      postId: request.postId,
    );
  }
}
