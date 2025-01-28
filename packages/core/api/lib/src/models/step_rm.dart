import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step_rm.g.dart';

@JsonSerializable(createToJson: false)
class StepRM extends Equatable {
  @JsonKey(name: 'step')
  final int? step;

  @JsonKey(name: 'step_content')
  final String? stepContent;

  @JsonKey(name: 'step_content_mm')
  final String? stepContentMM;

  @JsonKey(name: 'thumb_image')
  final String? thumbnailImage;

  @JsonKey(name: 'medium_image')
  final String? mediumImage;

  @JsonKey(name: 'large_image')
  final String? largeImage;

  const StepRM({
    this.step,
    this.stepContent,
    this.stepContentMM,
    this.thumbnailImage,
    this.mediumImage,
    this.largeImage,
  });

  @override
  List<Object?> get props =>
      [
        step,
        stepContent,
        stepContentMM,
        thumbnailImage,
        mediumImage,
        largeImage,
      ];

  factory StepRM.fromJson(Map<String, dynamic> json) => _$StepRMFromJson(json);

  StepModel toDomainModel() {
    return StepModel(
      step: step ?? 0,
      stepContent: stepContent ?? '',
      stepContentMM: stepContentMM ?? '',
      thumbnailImage: thumbnailImage ?? '',
      mediumImage: mediumImage ?? '',
      largeImage: largeImage ?? '',
    );
  }
}
