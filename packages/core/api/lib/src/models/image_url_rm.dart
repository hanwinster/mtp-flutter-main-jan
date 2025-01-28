import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_url_rm.g.dart';

@JsonSerializable(createToJson: false)
class ImageUrlRM extends Equatable {
  @JsonKey(name: 'original')
  final String? original;
  @JsonKey(name: 'thumb')
  final String? thumbnail;
  @JsonKey(name: 'medium')
  final String? medium;
  @JsonKey(name: 'large')
  final String? large;

  const ImageUrlRM({
    this.original,
    this.thumbnail,
    this.medium,
    this.large,
  });

  @override
  List<Object?> get props => [original, thumbnail, medium, large];

  factory ImageUrlRM.fromJson(Map<String, dynamic> json) => _$ImageUrlRMFromJson(json);

  ImageUrl toDomainModel() {
    return ImageUrl(
      original: original ?? '',
      thumbnail: thumbnail ?? '',
      medium: medium ?? '',
      large: large ?? '',
    );
  }
}