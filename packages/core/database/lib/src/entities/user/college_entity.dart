import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'college_entity.g.dart';

@JsonSerializable()
class CollegeEntity extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String name;

  const CollegeEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory CollegeEntity.fromJson(Map<String, dynamic> json) =>
      _$CollegeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CollegeEntityToJson(this);

  College toDomainModel() => College(
        id: id,
        name: name,
      );
}
