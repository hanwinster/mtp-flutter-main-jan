import 'package:domain/domain.dart';

class InteractiveSlider extends InteractiveFeature {
  final String title;
  final String description;
  final String imageUrl;

  const InteractiveSlider({
    required super.id,
    required this.title,
    required this.description,
    required super.position,
    required super.placement,
    required this.imageUrl,
  }): super(type: InteractiveFeatureType.slider);

  @override
  List<Object> get props => super.props
    ..addAll([
      title,
      description,
      imageUrl,
    ]);
}
