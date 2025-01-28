import 'package:domain/domain.dart' hide Reaction;
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:ui/ui.dart';

import 'interaction.dart';

typedef OnReactionChanged = void Function({
  required ReactionType? oldReaction,
  required ReactionType newReaction,
});

class ReactionItem extends StatelessWidget {
  const ReactionItem({
    super.key,
    required this.userReaction,
    required this.likeCount,
    required this.onReactionChanged,
  });

  final ReactionType? userReaction;
  final int likeCount;
  final OnReactionChanged onReactionChanged;

  List<Reaction<ReactionType>> get reactions {
    return [
      ReactionType.like,
      ReactionType.informative,
      ReactionType.thankYou,
      ReactionType.question,
      ReactionType.inspiring,
    ].map((reaction) {
      return Reaction(
        value: reaction,
        icon: reaction.icon(width: 12, height: 12),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionButton<ReactionType>(
      itemSize: const Size(35, 35),
      toggle: false,
      itemsSpacing: 20,
      itemScale: .5,
      boxPadding:
          const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      onReactionChanged: (Reaction<ReactionType>? reaction) {
        final newReaction = reaction?.value;
        if (newReaction == null) {
          return;
        }

        onReactionChanged(
          oldReaction: userReaction,
          newReaction: newReaction,
        );
      },
      reactions: reactions,
      child: InteractionItem(
        icon: userReaction != ReactionType.unknown && likeCount > 0
            ? userReaction?.icon(
                  width: 20,
                  height: 20,
                  color: context.colorScheme.primary,
                ) ??
                MtpAssets.images.thematicUnLikeIcon.image(
                  width: 20,
                  height: 20,
                )
            : MtpAssets.images.thematicUnLikeIcon.image(
                width: 20,
                height: 20,
              ),
        text: context.l10n.postLabelReactionCount(likeCount),
        textColor: userReaction != null &&
                userReaction != ReactionType.unknown &&
                likeCount > 0
            ? context.colorScheme.primary
            : null,
      ),
    );
  }
}
