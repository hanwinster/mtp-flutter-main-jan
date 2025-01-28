enum ReactionType {
  like,
  insightful,
  thankYou,
  question,
  wow,
  inspiring,
  informative,
  unknown,
}

class ReactionTypeHelper {
  static const Map<ReactionType, String> _reactionValues = {
    ReactionType.like: 'like',
    ReactionType.insightful: 'insightful',
    ReactionType.thankYou: 'thankYou',
    ReactionType.question: 'question',
    ReactionType.wow: 'wow',
    ReactionType.inspiring: 'inspiring',
    ReactionType.informative: 'informative',
    ReactionType.unknown: 'unknown',
  };

  static String getString(ReactionType reactionType) {
    return _reactionValues[reactionType] ?? 'unknown';
  }

  static ReactionType getEnum(String value) {
    return _reactionValues.entries
        .firstWhere(
          (entry) => entry.value == value,
          orElse: () => value == "thankyou"
              ? MapEntry(ReactionType.thankYou,
                  'thankYou') //api response is thankyou , diff 'Y'
              : const MapEntry(ReactionType.unknown, 'unknown'),
        )
        .key;
  }
}
