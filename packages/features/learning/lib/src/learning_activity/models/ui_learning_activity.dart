import 'package:base/base.dart';
import 'package:domain/domain.dart';


class UiLearningActivity extends Equatable {
  final String id;
  final String title;
  final String description;
  final Media? media;
  final List<InteractiveFeatureGroup> upperInteractiveFeatureGroups;
  final List<InteractiveFeatureGroup> lowerInteractiveFeatureGroups;

  const UiLearningActivity({
    required this.id,
    required this.title,
    required this.description,
    required this.media,
    required this.upperInteractiveFeatureGroups,
    required this.lowerInteractiveFeatureGroups,
  });

  @override
  List<Object?> get props =>
      [
        id,
        title,
        description,
        media,
        upperInteractiveFeatureGroups,
        lowerInteractiveFeatureGroups,
      ];

  factory UiLearningActivity.fromDomainModel(LearningActivity activity) {
    return UiLearningActivity(
      id: activity.id,
      title: activity.title,
      description: activity.description,
      media: activity.media,
      upperInteractiveFeatureGroups: InteractiveFeatureGroup.groupUpperInteractiveFeatures(activity.interactiveFeatures),
      lowerInteractiveFeatureGroups: InteractiveFeatureGroup.groupLowerInteractiveFeatures(activity.interactiveFeatures),
    );
  }

  UiLearningActivity copyWith({
    String? id,
    String? title,
    String? description,
    Media? media,
    List<InteractiveFeatureGroup>? upperInteractiveFeatureGroups,
    List<InteractiveFeatureGroup>? lowerInteractiveFeatureGroups,
  }) {
    return UiLearningActivity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      media: media ?? this.media,
      upperInteractiveFeatureGroups:
          upperInteractiveFeatureGroups ?? this.upperInteractiveFeatureGroups,
      lowerInteractiveFeatureGroups:
          lowerInteractiveFeatureGroups ?? this.lowerInteractiveFeatureGroups,
    );
  }
}
