import 'package:base/base.dart';

class EvaluationLikertLevel extends Equatable {
  final int level;
  final String description;

  @override
  List<Object> get props => [level, description];

  const EvaluationLikertLevel({
    required this.level,
    required this.description,
  });
}