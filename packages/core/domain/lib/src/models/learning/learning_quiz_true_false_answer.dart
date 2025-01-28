import 'package:base/base.dart';

class LearningQuizTrueFalseAnswer extends Equatable {
  final String id;
  final bool answer;

  const LearningQuizTrueFalseAnswer({
    required this.id,
    required this.answer,
  });

  @override
  List<Object> get props => [id, answer];
}
