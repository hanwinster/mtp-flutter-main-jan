import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_rm.dart';

part 'my_course_list_response.g.dart';

@JsonSerializable(createToJson: false)
class MyCourseListResponse extends Equatable {
  @JsonKey(name: 'courses')
  final List<CourseRM>? courses;

  const MyCourseListResponse({
    this.courses,
  });

  @override
  List<Object?> get props => [courses];

  factory MyCourseListResponse.fromJson(Map<String, dynamic> json) =>
      _$MyCourseListResponseFromJson(json);

}