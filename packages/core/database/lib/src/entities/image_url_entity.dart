import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_url_entity.g.dart';

@JsonSerializable()
class ImageUrlEntity extends Equatable {
  @JsonKey(name: 'original')
  final String original;
  @JsonKey(name: 'thumb')
  final String thumbnail;
  @JsonKey(name: 'medium')
  final String medium;
  @JsonKey(name: 'large')
  final String large;

  const ImageUrlEntity({
    required this.original,
    required this.thumbnail,
    required this.medium,
    required this.large,
  });

  factory ImageUrlEntity.empty() {
    return const ImageUrlEntity(
      original: '',
      thumbnail: '',
      medium: '',
      large: '',
    );
  }

  @override
  List<Object?> get props => [
        original,
        thumbnail,
        medium,
        large,
      ];

  factory ImageUrlEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageUrlEntityToJson(this);

  ImageUrl toDomainModel() {
    return ImageUrl(
      original: original,
      thumbnail: thumbnail,
      medium: medium,
      large: large,
    );
  }
}
