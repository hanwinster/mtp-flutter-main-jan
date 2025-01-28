import 'package:base/base.dart';

class SubscriptionTerm extends Equatable {
  final String title;
  final String intro;
  final String useOfMaterials;
  final String generalDisclaimer;

  const SubscriptionTerm({
    required this.title,
    required this.intro,
    required this.useOfMaterials,
    required this.generalDisclaimer,
  });

  @override
  List<Object> get props => [title, intro, useOfMaterials, generalDisclaimer,];
}