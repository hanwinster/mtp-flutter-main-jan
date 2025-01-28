import 'package:base/base.dart';
import 'package:domain/domain.dart';


class UiSummary extends Equatable {
  final String id;
  final String title;
  final String description;
  final Media? media;
  final List<InteractiveFeatureGroup> upperInteractiveFeatureGroups;
  final List<InteractiveFeatureGroup> lowerInteractiveFeatureGroups;

  const UiSummary({
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

  factory UiSummary.fromDomainModel(LearningSummary summary) {
    return UiSummary(
      id: summary.id,
      title: summary.title,
      description: summary.description,
      media: summary.media,
      upperInteractiveFeatureGroups: InteractiveFeatureGroup.groupUpperInteractiveFeatures(summary.interactiveFeatures),
      lowerInteractiveFeatureGroups: InteractiveFeatureGroup.groupLowerInteractiveFeatures(summary.interactiveFeatures),
    );
  }

  UiSummary copyWith({
    String? id,
    String? title,
    String? description,
    Media? media,
    List<InteractiveFeatureGroup>? upperInteractiveFeatureGroups,
    List<InteractiveFeatureGroup>? lowerInteractiveFeatureGroups,
  }) {
    return UiSummary(
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
