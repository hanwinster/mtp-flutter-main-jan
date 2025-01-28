import 'package:domain/domain.dart';

class InteractiveProcess extends InteractiveFeature {
  final String title;
  final String description;
  final String imageUrl;

  const InteractiveProcess({
    required super.id,
    required super.position,
    required super.placement,
    required this.title,
    required this.description,
    required this.imageUrl,
  }): super(type: InteractiveFeatureType.process);

  @override
  List<Object> get props => super.props
    ..addAll([
      title,
      description,
      imageUrl,
    ]);
}
