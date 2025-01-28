import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/common/common.dart';
import 'package:ui/ui.dart';

class InteractiveFeatureGroupWidget extends StatelessWidget {
  const InteractiveFeatureGroupWidget({
    super.key,
    required this.groups,
  });

  final List<InteractiveFeatureGroup> groups;

  List<Widget> _buildInteractiveFeatures(BuildContext context) {
    final List<Widget> widgets = [];
    for (final (index, group) in groups.indexed) {
      if (index > 0) {
        widgets.add(const SizedBox(height: Grid.two));
      }
      switch (group.type) {
        case InteractiveFeatureType.accordion:
          widgets.add(AccordionListView(
            items:
                group.features.map((e) => e as InteractiveAccordion).toList(),
          ));
        case InteractiveFeatureType.flipCard:
          widgets.add(FlipCardListView(
            items: group.features.map((e) => e as InteractiveFlipCard).toList(),
          ));
        case InteractiveFeatureType.slider:
          widgets.add(SliderListView(
            items: group.features.map((e) => e as InteractiveSlider).toList(),
          ));
        case InteractiveFeatureType.sortingActivity:
          widgets.add(SortingActivityListView(
            items: group.features
                .map((e) => e as InteractiveSortingActivity)
                .toList(),
          ));
        case InteractiveFeatureType.imageText:
          widgets.add(ImageTextListView(
            items: group.features.map((e) => e as InteractiveImageText).toList(),
          ));
        case InteractiveFeatureType.process:
          widgets.add(ProcessListView(
            items: group.features.map((e) => e as InteractiveProcess).toList(),
          ));
        case InteractiveFeatureType.unknown:
          break;
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildInteractiveFeatures(context),
    );
  }
}
