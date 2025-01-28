import 'package:base/base.dart';

class StepModel extends Equatable {
  final int step;
  final String stepContent;
  final String stepContentMM;
  final String thumbnailImage;
  final String mediumImage;
  final String largeImage;

  const StepModel({
    required this.step,
    required this.stepContent,
    required this.stepContentMM,
    required this.thumbnailImage,
    required this.mediumImage,
    required this.largeImage,
  });

  @override
  List<Object> get props => [
        step,
        stepContent,
        stepContentMM,
        thumbnailImage,
        mediumImage,
        largeImage,
      ];
}
