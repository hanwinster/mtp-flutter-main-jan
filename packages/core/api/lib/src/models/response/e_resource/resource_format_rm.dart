import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';


part 'resource_format_rm.g.dart';

@JsonSerializable(createToJson: false)
class ResourceFormatRM extends Equatable {

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'title')
  final String? title;

  const ResourceFormatRM({
    this.id,
    this.title,
  });

  factory ResourceFormatRM.fromJson(Map<String, dynamic> json) =>
      _$ResourceFormatRMFromJson(json);


  @override
  List<Object?> get props => [id, title];

  ResourceFormat toDomainModel() {
    return ResourceFormat(
      id: id ?? (throw Exception('Subject id is null')),
      title: title ?? '',
    );
  }
}