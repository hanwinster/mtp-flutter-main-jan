import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_material_rm.g.dart';

@JsonSerializable()
class CourseMaterialRM extends Equatable {
  @JsonKey(name: 'key')
  final String? key;
  @JsonKey(name: 'isCompleted')
  final int? isCompleted;
  @JsonKey(name: 'id')
  final dynamic id;
  @JsonKey(name: 'type', unknownEnumValue: CourseMaterialTypeRM.unknown)
  final CourseMaterialTypeRM? type;
  @JsonKey(name: 'title')
  final String? title;
  const CourseMaterialRM({
    this.key,
    this.isCompleted,
    this.id,
    this.type,
    this.title,
  });

  @override
  List<Object?> get props => [key, isCompleted, id, type, title];

  factory CourseMaterialRM.fromJson(Map<String, dynamic> json) => _$CourseMaterialRMFromJson(json);

  CourseMaterial toDomainModel() {
    return CourseMaterial(
      id: id?.toString() ?? '',
      title: title ?? '',
      isCompleted: isCompleted == 1,
      key: key ?? '',
      type: type?.toDomainModel() ?? CourseMaterialType.unknown,
      submodules: const [],
    );
  }

}