import 'package:base/base.dart';

class InteractiveSortingAnswerOption extends Equatable {
  final int key;
  final String answer;

  const InteractiveSortingAnswerOption({
    required this.key,
    required this.answer,
  });

  @override
  List<Object?> get props => [key, answer];
}


