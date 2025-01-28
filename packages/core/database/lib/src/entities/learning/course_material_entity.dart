import 'package:base/base.dart';
import 'package:database/src/entities/learning/course_material_type_entity.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_material_entity.g.dart';

@JsonSerializable()
class CourseMaterialEntity extends Equatable {
  @JsonKey(name: 'key')
  final String key;
  @JsonKey(name: 'isCompleted')
  final bool isCompleted;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'type', unknownEnumValue: CourseMaterialTypeEntity.unknown)
  final CourseMaterialTypeEntity type;
  @JsonKey(name: 'title')
  final String title;

  const CourseMaterialEntity({
    required this.key,
    required this.isCompleted,
    required this.id,
    required this.type,
    required this.title,
  });

  @override
  List<Object?> get props => [key, isCompleted, id, type, title];

  factory CourseMaterialEntity.fromJson(Map<String, dynamic> json) => _$CourseMaterialEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CourseMaterialEntityToJson(this);

  CourseMaterial toDomainModel() {
    return CourseMaterial(
      id: id.toString(),
      title: title,
      isCompleted: isCompleted,
      key: key ?? '',
      type: type.toDomainModel(),
      submodules: const [],
    );
  }

}