import 'package:domain/domain.dart';

class InteractiveAccordion extends InteractiveFeature {
  final String title;
  final String description;
  final String imageUrl;

  const InteractiveAccordion({
    required super.id,
    required super.position,
    required super.placement,
    required this.title,
    required this.description,
    required this.imageUrl,
  }): super(type: InteractiveFeatureType.accordion);

  @override
  List<Object> get props => super.props..addAll([title, description, imageUrl]);
}
