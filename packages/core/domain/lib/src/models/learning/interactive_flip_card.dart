import 'package:domain/domain.dart';

class InteractiveFlipCard extends InteractiveFeature {
  final String frontTitle;
  final String frontDescription;
  final String backTitle;
  final String backDescription;
  final String frontImageUrl;
  final String backImageUrl;

  const InteractiveFlipCard({
    required super.id,
    required this.frontTitle,
    required this.frontDescription,
    required this.backTitle,
    required this.backDescription,
    required super.position,
    required super.placement,
    required this.frontImageUrl,
    required this.backImageUrl,
  }): super(type: InteractiveFeatureType.flipCard);

  @override
  List<Object> get props => super.props
    ..addAll([
      frontTitle,
      frontDescription,
      backTitle,
      backDescription,
      frontImageUrl,
      backImageUrl,
    ]);
}
