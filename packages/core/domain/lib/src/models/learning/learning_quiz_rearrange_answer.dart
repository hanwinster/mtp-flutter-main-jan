import 'package:base/base.dart';


class LearningQuizRearrangeAnswer extends Equatable {
  final String id;
  final List<String> options;
  final List<String> correctOrder;

  const LearningQuizRearrangeAnswer({
    required this.id,
    required this.options,
    required this.correctOrder,
  });

  @override
  List<Object> get props => [id, options, correctOrder];
}
