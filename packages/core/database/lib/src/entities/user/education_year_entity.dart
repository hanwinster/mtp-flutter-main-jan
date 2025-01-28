import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'education_year_entity.g.dart';

@JsonSerializable()
class EducationYearEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;

  const EducationYearEntity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];

  factory EducationYearEntity.fromJson(Map<String, dynamic> json) => _$EducationYearEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EducationYearEntityToJson(this);

  EducationYear toDomainModel() => EducationYear(
    id: id,
    title: title,
  );
}