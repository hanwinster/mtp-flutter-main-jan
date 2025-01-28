import 'package:domain/domain.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

Map<String, QuizAnswer> mapQuizAnswers(
  Map<String, UserAnswer> answers,
) {
  return answers.map(
    (key, value) {
      switch(value) {
        case UserTextAnswer():
          return MapEntry(
            key,
            QuizStringAnswer(
              answer: value.text,
            ),
          );
        default:
          //TODO: implement other types of answers
          return MapEntry(
            key,
            const QuizStringAnswer(
              answer: 'no-op',
            ),
          );
      }

    },
  );
}