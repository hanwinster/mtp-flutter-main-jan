part of 'question_sheet_bloc.dart';

sealed class QuestionSheetEvent extends Equatable {
  const QuestionSheetEvent();
}

class QuestionSheetQuestionsChanged extends QuestionSheetEvent {
  const QuestionSheetQuestionsChanged(this.questions);
  final List<QuestionData> questions;

  @override
  List<Object?> get props => [questions];
}

class QuestionSheetEvaluated extends QuestionSheetEvent {
  const QuestionSheetEvaluated();

  @override
  List<Object?> get props => [];
}

class QuestionSheetValidated extends QuestionSheetEvent {
  const QuestionSheetValidated();

  @override
  List<Object?> get props => [];
}

class QuestionSheetReset extends QuestionSheetEvent {
  const QuestionSheetReset();

  @override
  List<Object?> get props => [];
}

class QuestionSheetAnswerChanged extends QuestionSheetEvent {
  const QuestionSheetAnswerChanged(this.questionId,
      this.answer,);

  final String questionId;
  final UserAnswer answer;

  @override
  List<Object> get props => [questionId, answer];
}

class QuestionSheetSubmitted extends QuestionSheetEvent {
  const QuestionSheetSubmitted();

  @override
  List<Object?> get props => [];
}
