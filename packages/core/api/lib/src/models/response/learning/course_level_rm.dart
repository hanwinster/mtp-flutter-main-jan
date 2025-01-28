import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_level_rm.g.dart';

@JsonSerializable(createToJson: false)
final class CourseLevelRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'value')
  final String? value;

  const CourseLevelRM({
    this.id,
    this.name,
    this.value,
  });

  @override
  List<Object?> get props => [id, name, value];

  factory CourseLevelRM.fromJson(Map<String, dynamic> json) =>
      _$CourseLevelRMFromJson(json);

  CourseLevel toDomainModel() {
    return CourseLevel(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      name: name ?? '',
      value: value ?? '',
    );
  }
}
