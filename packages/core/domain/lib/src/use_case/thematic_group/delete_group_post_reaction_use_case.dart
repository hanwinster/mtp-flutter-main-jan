import 'package:base/base.dart';

import '../../../domain.dart';

class DeleteGroupPostReactionUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  DeleteGroupPostReactionUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<void> call({
    required String reactionId,
  }) {
    return _thematicGroupRepository.deleteReaction(
      reactionId: reactionId,
    );
  }
}
