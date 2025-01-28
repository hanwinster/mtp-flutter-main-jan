import 'package:domain/domain.dart';

import 'package:ui/ui.dart';

class MatchingPairDropdownItemState extends DropdownItemState {
  MatchingPairDropdownItemState({
    required this.pair,
  }) : super(itemLabel: pair.answerText);

  final LearningQuizMatchingPair pair;

  factory MatchingPairDropdownItemState.fromDomain(LearningQuizMatchingPair pair) {
    return MatchingPairDropdownItemState(pair: pair);
  }
}
