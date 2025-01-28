
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class InteractiveFeature extends Equatable {
  final String id;
  final int position;
  final InteractiveFeaturePlacement placement;
  final InteractiveFeatureType type;

  const InteractiveFeature({
    required this.id,
    required this.position,
    required this.placement,
    required this.type,
  });

  @override
  List<Object> get props => [
    id,
    position,
    placement,
    type,
  ];
}
