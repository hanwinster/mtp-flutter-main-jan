import 'package:base/base.dart';
import 'package:domain/domain.dart';

class InteractiveFeatureGroup extends Equatable {
  final InteractiveFeatureType type;
  final int position;
  final InteractiveFeaturePlacement placement;
  final List<InteractiveFeature> features;

  const InteractiveFeatureGroup({
    required this.type,
    required this.position,
    required this.placement,
    required this.features,
  });

  @override
  List<Object> get props =>
      [
        type,
        position,
        placement,
        features,
      ];

  static List<InteractiveFeatureGroup> groupInteractiveFeatures(
      List<InteractiveFeature> features) {
    List<InteractiveFeatureGroup> groups = [];

    for (var feature in features) {
      var existingGroup = groups.firstWhereOrNull(
              (group) =>
          group.type == feature.type &&
              group.position == feature.position &&
              group.placement == feature.placement);

      if (existingGroup != null) {
        existingGroup.features.add(feature);
      } else {
        groups.add(InteractiveFeatureGroup(
          type: feature.type,
          position: feature.position,
          placement: feature.placement,
          features: [feature],
        ));
      }
    }

    groups.sort((a, b) => a.position.compareTo(b.position));

    return groups;
  }

  static List<InteractiveFeatureGroup> groupUpperInteractiveFeatures(
      List<InteractiveFeature> features) {
    final upperFeatures = features.where((feature) =>
    feature.placement == InteractiveFeaturePlacement.above);
    return groupInteractiveFeatures(upperFeatures.toList());
  }

  static List<InteractiveFeatureGroup> groupLowerInteractiveFeatures(
      List<InteractiveFeature> features) {
    final lowerFeatures = features.where((feature) =>
    feature.placement == InteractiveFeaturePlacement.below);
    return groupInteractiveFeatures(lowerFeatures.toList());
  }
}