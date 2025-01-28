import 'package:api/api.dart';
import 'package:api/src/json/converters/converters.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_discussion_message_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class CourseDiscussionMessageRM {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "discussion_id")
  final int? discussionId;
  @JsonKey(name: "user")
  final UserRM? user;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  CourseDiscussionMessageRM ({
    this.id,
    this.discussionId,
    this.user,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseDiscussionMessageRM.fromJson(Map<String, dynamic> json) {
    return _$CourseDiscussionMessageRMFromJson(json);
  }

  CourseDiscussionMessage toDomainModel() {
    return CourseDiscussionMessage(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      user: user?.toDomainModel(),
      message: message ?? '',
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
    );
  }
}


