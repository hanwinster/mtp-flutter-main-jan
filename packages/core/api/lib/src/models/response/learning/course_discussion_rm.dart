import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../json/converters/converters.dart';

part 'course_discussion_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class CourseDiscussionRM {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "allow_takers")
  final int? allowTakers;
  @JsonKey(name: "allow_learners")
  final int? allowLearners;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  CourseDiscussionRM ({
    this.id,
    this.courseId,
    this.title,
    this.description,
    this.allowTakers,
    this.allowLearners,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseDiscussionRM.fromJson(Map<String, dynamic> json) {
    return _$CourseDiscussionRMFromJson(json);
  }

  CourseDiscussion toDomainModel() {
    return CourseDiscussion(
      id: id?.toString() ?? (throw Exception("id is null")),
      title: title ?? '',
      description: description ?? '',
      allowTakers: allowTakers == 1,
      allowLearners: allowLearners == 1,
    );
  }
}


