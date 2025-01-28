import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui/ui.dart';

import 'components/components.dart';

class CourseReviewsContent extends StatelessWidget {
  const CourseReviewsContent({
    super.key,
    required this.items,
  });

  final List<CourseReview> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CourseReviewSummary(
          totalReviews: items.length,
          averageRating: items.map((e) => e.rating).reduce((a, b) => a + b) / items.length,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: Grid.two),
            padding: const EdgeInsets.only(
              left: Grid.two,
              right: Grid.two,
              top: Grid.two,
              bottom: 96,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return CourseReviewTile(item: item);
            },
          ),
        ),
      ],
    );
  }
}
