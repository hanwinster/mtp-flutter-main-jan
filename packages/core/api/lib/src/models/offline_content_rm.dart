import 'package:api/src/models/step_rm.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offline_content_rm.g.dart';

@JsonSerializable(createToJson: false)
class OfflineContentRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'title_mm')
  final String? titleMM;

  @JsonKey(name: 'steps')
  final List<StepRM>? steps;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'published')
  final int? published;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const OfflineContentRM({
    this.id,
    this.title,
    this.titleMM,
    this.steps,
    this.slug,
    this.published,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        titleMM,
        steps,
        slug,
        published,
        userId,
        createdAt,
        updatedAt,
      ];

  factory OfflineContentRM.fromJson(Map<String, dynamic> json) =>
      _$OfflineContentRMFromJson(json);

  OfflineContentModel toDomainModel() {
    return OfflineContentModel(
      id: id ?? 0,
      title: title ?? '',
      titleMM: titleMM ?? '',
      steps: steps?.map((e) => e.toDomainModel()).toList() ?? [],
      slug: slug ?? '',
      published: published ?? 0,
      userId: userId ?? 0,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }
}
