import 'package:base/base.dart';

import '../../../domain.dart';

class CreateGroupPostReactionUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  CreateGroupPostReactionUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<Reaction> call({
    required String groupId,
    required String reactionToId,
    required ReactionType reaction,
    required ThematicGroupReactionToType reactionToType,
  }) {
    return _thematicGroupRepository.createReaction(
      groupId: groupId,
      reactionToId: reactionToId,
      reaction: reaction,
      reactionToType: reactionToType,
    );
  }
}
