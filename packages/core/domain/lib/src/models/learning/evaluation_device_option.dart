import 'package:base/base.dart';

class EvaluationDeviceOption extends Equatable {
  final String id;
  final String description;

  const EvaluationDeviceOption({
    required this.id,
    required this.description,
  });

  @override
  List<Object> get props => [id, description];
}