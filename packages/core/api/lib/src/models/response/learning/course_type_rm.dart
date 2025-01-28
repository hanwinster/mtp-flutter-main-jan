import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_type_rm.g.dart';

@JsonSerializable(createToJson: false)
final class CourseTypeRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  const CourseTypeRM({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory CourseTypeRM.fromJson(Map<String, dynamic> json) =>
      _$CourseTypeRMFromJson(json);

  CourseType toDomainModel() {
    return CourseType(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      name: name ?? '',
    );
  }
}