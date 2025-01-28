import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_category_rm.g.dart';

@JsonSerializable(createToJson: false)
class CourseCategoryRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  const CourseCategoryRM({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory CourseCategoryRM.fromJson(Map<String, dynamic> json) =>
      _$CourseCategoryRMFromJson(json);

  CourseCategory toDomainModel() => CourseCategory(
        id: id?.toString() ?? (throw Exception("id must not be null")),
        name: name ?? '',
      );
}
