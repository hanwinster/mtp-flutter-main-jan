import 'package:api/src/json/converters/converters.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_category_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class ThematicGroupCategoryRM {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'number_of_groups')
  final int? numberOfGroups;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  ThematicGroupCategoryRM({
    this.id,
    this.name,
    this.numberOfGroups,
    this.createdAt,
    this.updatedAt,
  });

  factory ThematicGroupCategoryRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupCategoryRMFromJson(json);

  ThematicGroupCategory toDomainModel() {
    return ThematicGroupCategory(
      id: id ?? (throw Exception('id is null')),
      name: name ?? '',
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
      numberOfGroups: numberOfGroups ?? 0,
    );
  }
}