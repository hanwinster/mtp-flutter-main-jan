import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slide_image_rm.g.dart';

@JsonSerializable(createToJson: false)
class SlideImageRM extends Equatable {

  @JsonKey(name: 'original')
  final String? original;

  @JsonKey(name: 'thumb')
  final String? thumb;

  @JsonKey(name: 'medium')
  final String? medium;

  @JsonKey(name: 'large')
  final String? large;

  const SlideImageRM({
    this.original,
    this.thumb,
    this.medium,
    this.large,
  });

  @override
  List<Object?> get props => [original, thumb, medium, large];

  factory SlideImageRM.fromJson(Map<String, dynamic> json) =>
      _$SlideImageRMFromJson(json);

  SlideImageModel toDomainModel() {
    return SlideImageModel(
      original: original ?? '',
      thumb: thumb ?? '',
      medium: medium ?? '',
      large: large ?? '',
    );
  }
}