import 'package:domain/domain.dart';

class InteractiveSortingActivity extends InteractiveFeature {
  final String description;
  final List<InteractiveSortingAnswerOption> options;
  final int correctAnswerKey;

  const InteractiveSortingActivity({
    required super.id,
    required super.position,
    required super.placement,
    required this.description,
    required this.options,
    required this.correctAnswerKey,
  }): super(type: InteractiveFeatureType.sortingActivity);

  @override
  List<Object> get props => super.props
    ..addAll([
      description,
      options,
      correctAnswerKey,
    ]);
}
