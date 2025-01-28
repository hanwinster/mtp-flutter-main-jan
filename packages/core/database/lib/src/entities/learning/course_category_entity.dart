import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_category_entity.g.dart';

@JsonSerializable()
class CourseCategoryEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;

  const CourseCategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  factory CourseCategoryEntity.fromJson(Map<String, dynamic> json) => _$CourseCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoryEntityToJson(this);

  CourseCategory toDomainModel() {
    return CourseCategory(
      id: id,
      name: name,
    );
  }
}