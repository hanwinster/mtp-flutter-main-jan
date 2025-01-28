import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_navigation_direction_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseNavigationDirectionRM {
  @JsonValue('previous')
  previous,
  @JsonValue('next')
  next,
  @JsonValue('unknown')
  unknown;


  factory CourseNavigationDirectionRM.fromJson(String value) => decodeEnum(
    _$CourseNavigationDirectionRMEnumMap,
    value,
    unknownValue: CourseNavigationDirectionRM.unknown,
  );

  String toJson() => encodeEnum(_$CourseNavigationDirectionRMEnumMap, this);

  factory CourseNavigationDirectionRM.fromDomainModel(CourseNavigationDirection domainModel) {
    switch (domainModel) {
      case CourseNavigationDirection.previous:
        return CourseNavigationDirectionRM.previous;
      case CourseNavigationDirection.next:
        return CourseNavigationDirectionRM.next;
      default:
        return CourseNavigationDirectionRM.unknown;
    }
  }

  CourseNavigationDirection toDomainModel() {
    switch (this) {
      case CourseNavigationDirectionRM.previous:
        return CourseNavigationDirection.previous;
      case CourseNavigationDirectionRM.next:
        return CourseNavigationDirection.next;
      default:
        return CourseNavigationDirection.unknown;
    }
  }
}