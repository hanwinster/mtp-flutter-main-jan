import 'package:api/api.dart';
import 'package:database/database.dart';

extension ReactionTypeRMEntityMapper on ReactionTypeRM {
  ReactionTypeEntity toEntity() {
    switch (this) {
      case ReactionTypeRM.like:
        return ReactionTypeEntity.like;
      case ReactionTypeRM.insightful:
        return ReactionTypeEntity.insightful;
      case ReactionTypeRM.thankYou:
        return ReactionTypeEntity.thankYou;
      case ReactionTypeRM.question:
        return ReactionTypeEntity.question;
      case ReactionTypeRM.wow:
        return ReactionTypeEntity.wow;
      case ReactionTypeRM.inspiring:
        return ReactionTypeEntity.inspiring;
      case ReactionTypeRM.informative:
        return ReactionTypeEntity.informative;
      case ReactionTypeRM.unknown:
        return ReactionTypeEntity.unknown;
    }
  }
}
