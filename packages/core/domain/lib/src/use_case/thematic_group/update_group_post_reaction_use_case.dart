import 'package:base/base.dart';

import '../../../domain.dart';

class UpdateGroupPostReactionUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  UpdateGroupPostReactionUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<Reaction> call({
    required String reactionId,
    required ReactionType reaction,
  }) {
    return _thematicGroupRepository.updateReaction(
      reactionId: reactionId,
      reaction: reaction,
    );
  }
}
