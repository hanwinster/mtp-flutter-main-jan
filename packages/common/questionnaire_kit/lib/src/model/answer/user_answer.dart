import 'package:base/base.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

sealed class UserAnswer extends Equatable {
  const UserAnswer();
}

class UserTextAnswer extends UserAnswer {
  const UserTextAnswer(this.text);
  final String text;

  @override
  List<Object?> get props => [text];
}

class UserOptionAnswer extends UserAnswer {
  const UserOptionAnswer(this.option);

  final AnswerOption option;

  @override
  List<Object> get props => [option];
}

class UserOptionListAnswer extends UserAnswer {
  const UserOptionListAnswer(this.options);

  final List<AnswerOption> options;

  @override
  List<Object?> get props => [options];
}

class UserOptionMapAnswer extends UserAnswer {
  const UserOptionMapAnswer(this.optionsByPrompt);

  final Map<AnswerOption, AnswerOption> optionsByPrompt;

  @override
  List<Object?> get props => [optionsByPrompt];
}

class UserOptionsByIndexAnswer extends UserAnswer {
  const UserOptionsByIndexAnswer(this.optionsByIndex);

  final Map<int, AnswerOption> optionsByIndex;

  @override
  List<Object?> get props => [optionsByIndex];
}
