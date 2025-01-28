import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'education_year_rm.g.dart';

@JsonSerializable(createToJson: false)
class EducationYearRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;

  const EducationYearRM({
    this.id,
    this.title,
  });

  @override
  List<Object?> get props => [id, title];

  factory EducationYearRM.fromJson(Map<String, dynamic> json) => _$EducationYearRMFromJson(json);

  EducationYear toDomainModel() => EducationYear(
    id: id?.toString() ?? (throw Exception('id is null')),
    title: title ?? '',
  );
}