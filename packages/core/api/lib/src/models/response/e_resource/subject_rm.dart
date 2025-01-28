import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';


part 'subject_rm.g.dart';

@JsonSerializable(createToJson: false)
class SubjectRM extends Equatable {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'published')
  final int? published;

  @JsonKey(name: 'weight')
  final int? weight;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const SubjectRM({
    this.id,
    this.title,
    this.slug,
    this.published,
    this.weight,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory SubjectRM.fromJson(Map<String, dynamic> json) =>
      _$SubjectRMFromJson(json);

  @override
  List<Object?> get props =>
      [id, title, slug, published, weight, deletedAt, createdAt, updatedAt,];

  Subject toDomainModel() {
    return Subject(
      id: id?.toString() ?? (throw Exception('Subject id is null')),
      title: title ?? '',
      slug: slug ?? '',
      published: published ?? 0,
      weight: weight ?? 0,
      deletedAt: deletedAt ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }

}