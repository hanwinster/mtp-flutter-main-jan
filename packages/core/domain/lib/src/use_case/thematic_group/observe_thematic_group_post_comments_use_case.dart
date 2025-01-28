import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveThematicGroupPostCommentsUseCaseRequest extends Equatable {
  final String postId;

  const ObserveThematicGroupPostCommentsUseCaseRequest({
    required this.postId,
  });

  @override
  List<Object> get props => [postId];
}

class ObserveThematicGroupPostCommentsUseCase {
  final ThematicGroupPostCommentRepository _repository;

  ObserveThematicGroupPostCommentsUseCase({
    ThematicGroupPostCommentRepository? repository,
  }) : _repository = repository ?? getIt();

  Stream<Result<List<ThematicGroupPostComment>>> call(
    ObserveThematicGroupPostCommentsUseCaseRequest request,
  ) {
    return _repository.observeComments(postId: request.postId);
  }
}
