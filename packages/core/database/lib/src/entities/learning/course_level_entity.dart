import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_level_entity.g.dart';

@JsonSerializable()
final class CourseLevelEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'value')
  final String value;

  const CourseLevelEntity({
    required this.id,
    required this.name,
    required this.value,
  });

  @override
  List<Object?> get props => [id, name, value];

  factory CourseLevelEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseLevelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CourseLevelEntityToJson(this);

  CourseLevel toDomainModel() {
    return CourseLevel(
      id: id,
      name: name,
      value: value,
    );
  }
}
