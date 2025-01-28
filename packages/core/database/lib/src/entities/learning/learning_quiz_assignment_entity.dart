import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_assignment_entity.g.dart';

@JsonSerializable()
class LearningQuizAssignmentEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;

  const LearningQuizAssignmentEntity({
    required this.id,
  });

  @override
  List<Object> get props => [id];

  factory LearningQuizAssignmentEntity.fromJson(Map<String, dynamic> json) =>
      _$LearningQuizAssignmentEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LearningQuizAssignmentEntityToJson(this);

  LearningQuizAssignment toDomainModel() {
    return LearningQuizAssignment(
      id: id,
    );
  }
}
