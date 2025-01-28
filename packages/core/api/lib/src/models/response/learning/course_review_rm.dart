import 'package:api/api.dart';
import 'package:api/src/json/converters/converters.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_review_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class CourseReviewRM {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "user")
  final UserRM? user;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "rating")
  final num? rating;
  @JsonKey(name: "remark")
  final String? remark;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  CourseReviewRM ({
    this.id,
    this.user,
    this.courseId,
    this.rating,
    this.remark,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseReviewRM.fromJson(Map<String, dynamic> json) {
    return _$CourseReviewRMFromJson(json);
  }

  CourseReview toDomainModel() {
    return CourseReview(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      user: user?.toDomainModel(),
      rating: rating?.toDouble() ?? 0,
      remark: remark ?? '',
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
    );
  }
}


