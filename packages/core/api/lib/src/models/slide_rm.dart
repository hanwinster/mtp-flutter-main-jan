import 'package:api/src/models/slide_image_rm.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slide_rm.g.dart';

@JsonSerializable(createToJson: false)
class SlideRM extends Equatable {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'weight')
  final int? weight;

  @JsonKey(name: 'published')
  final int? published;


  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'slides')
  final SlideImageRM? slide;

  const SlideRM({
    this.id,
    this.title,
    this.description,
    this.weight,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.slide,
  });

  @override
  List<Object?> get props =>
      [
        id,
        title,
        description,
        weight,
        published,
        createdAt,
        updatedAt,
        slide,
      ];

  factory SlideRM.fromJson(Map<String, dynamic> json) => _$SlideRMFromJson(json);

    SlideModel toDomainModel() {
    return SlideModel(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      weight: weight ?? 0,
      published: published ?? 0,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      slide: slide?.toDomainModel() ?? const SlideImageModel(
        original: '',
        thumb: '',
        medium: '',
        large: '',
      ),
    );
  }
}