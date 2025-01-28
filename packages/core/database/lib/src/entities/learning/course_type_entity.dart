import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_type_entity.g.dart';

@JsonSerializable()
final class CourseTypeEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;

  const CourseTypeEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory CourseTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseTypeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTypeEntityToJson(this);

  CourseType toDomainModel() {
    return CourseType(
      id: id,
      name: name,
    );
  }
}