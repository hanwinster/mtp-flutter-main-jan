import 'package:base/base.dart';

class LearningQuizAssignment extends Equatable {
  final String id;

  const LearningQuizAssignment({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
