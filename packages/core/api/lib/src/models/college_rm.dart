import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'college_rm.g.dart';

@JsonSerializable(createToJson: false)
class CollegeRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? name;

  const CollegeRM({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory CollegeRM.fromJson(Map<String, dynamic> json) =>
      _$CollegeRMFromJson(json);

  College toDomainModel() => College(
        id: id?.toString() ?? (throw Exception('College id is null')),
        name: name ?? '',
      );
}
