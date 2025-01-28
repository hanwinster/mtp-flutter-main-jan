import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../converters/converters.dart';

part 'course_discussion_entity.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
final class CourseDiscussionEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'allow_takers')
  final bool allowTakers;
  @JsonKey(name: 'allow_learners')
  final bool allowLearners;
  @JsonKey(name: 'course_id')
  final String courseId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const CourseDiscussionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.allowTakers,
    required this.allowLearners,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        allowTakers,
        allowLearners,
        courseId,
        createdAt,
        updatedAt,
      ];

  factory CourseDiscussionEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseDiscussionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDiscussionEntityToJson(this);

  CourseDiscussion toDomainModel() {
    return CourseDiscussion(
      id: id,
      title: title,
      description: description,
      allowTakers: allowTakers,
      allowLearners: allowLearners,
    );
  }
}
