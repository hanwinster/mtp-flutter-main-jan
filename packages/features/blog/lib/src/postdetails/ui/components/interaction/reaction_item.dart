import 'package:domain/domain.dart' hide Reaction;
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:ui/ui.dart';

import '../components.dart';

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
      ReactionType.insightful,
      ReactionType.thankYou,
      ReactionType.question,
      ReactionType.wow,
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
        icon: userReaction?.icon(
              width: 20,
              height: 20,
              color: context.colorScheme.primary,
            ) ??
            MtpAssets.images.thematicUnLikeIcon.image(
              width: 20,
              height: 20,
            ),
        text: context.l10n.postLabelReactionCount(likeCount),
        textColor: userReaction != null ? context.colorScheme.primary : null,
      ),
    );
  }
}
