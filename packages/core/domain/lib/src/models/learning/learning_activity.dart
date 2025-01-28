import 'package:base/base.dart';
import 'package:domain/domain.dart';

class LearningActivity extends Equatable {
  final String id;
  final String title;
  final String description;
  final Media? media;
  final String lectureId;
  final List<InteractiveFeature> interactiveFeatures;

  const LearningActivity({
    required this.id,
    required this.title,
    required this.description,
    required this.media,
    required this.lectureId,
    required this.interactiveFeatures,
  });

  List<InteractiveAccordion> get upperAccordions => interactiveFeatures
      .whereType<InteractiveAccordion>()
      .where(
          (element) => element.placement == InteractiveFeaturePlacement.above)
      .toList();

  List<InteractiveAccordion> get lowerAccordions => interactiveFeatures
      .whereType<InteractiveAccordion>()
      .where(
          (element) => element.placement == InteractiveFeaturePlacement.below)
      .toList();

  List<InteractiveFlipCard> get upperFlipCards => interactiveFeatures
      .whereType<InteractiveFlipCard>()
      .where(
          (element) => element.placement == InteractiveFeaturePlacement.above)
      .toList();

  List<InteractiveFlipCard> get lowerFlipCards => interactiveFeatures
      .whereType<InteractiveFlipCard>()
      .where(
          (element) => element.placement == InteractiveFeaturePlacement.below)
      .toList();

  List<InteractiveSlider> get upperSliders => interactiveFeatures
      .whereType<InteractiveSlider>()
      .where(
          (element) => element.placement == InteractiveFeaturePlacement.above)
      .toList();

  List<InteractiveSlider> get lowerSliders => interactiveFeatures
      .whereType<InteractiveSlider>()
      .where(
          (element) => element.placement == InteractiveFeaturePlacement.below)
      .toList();

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        media,
        lectureId,
        interactiveFeatures,
      ];
}
