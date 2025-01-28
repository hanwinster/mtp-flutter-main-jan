import 'package:assets/assets.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

extension UiReactionTypeX on ReactionType {
  Widget icon({
    required double width,
    required double height,
    Color? color,
  }) {
    switch (this) {
      case ReactionType.like:
        return MtpAssets.images.thematicLikeIcon.image(
          width: width,
          height: height,
          color: color,
        );
      case ReactionType.insightful:
        return MtpAssets.images.thematicInsightfulIcon.image(
          width: width,
          height: height,
          color: color,
        );
      case ReactionType.informative:
        //TODO: change icon
        return MtpAssets.images.thematicInsightfulIcon.image(
          width: width,
          height: height,
          color: color,
        );
      case ReactionType.thankYou:
        return MtpAssets.images.thematicThankYouIcon.image(
          width: width,
          height: height,
          color: color,
        );
      case ReactionType.question:
        return MtpAssets.images.thematicQuestionIcon.image(
          width: width,
          height: height,
          color: color,
        );
      case ReactionType.wow:
        return MtpAssets.images.thematicWowIcon.image(
          width: width,
          height: height,
          color: color,
        );
      case ReactionType.inspiring:
        //TODO: change icon
        return MtpAssets.images.thematicWowIcon.image(
          width: width,
          height: height,
          color: color,
        );
      case ReactionType.unknown:
        return MtpAssets.images.thematicLikeIcon.image(
          width: width,
          height: height,
          color: color,
        );
    }
  }
}
