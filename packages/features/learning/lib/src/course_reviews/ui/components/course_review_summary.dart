import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui/ui.dart';

class CourseReviewSummary extends StatelessWidget {
  const CourseReviewSummary({
    super.key,
    required this.totalReviews,
    required this.averageRating,
  });

  final int totalReviews;
  final double averageRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Grid.two,
        vertical: Grid.two,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.l10n.courseReviewSummaryTitle,
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(width: Grid.two),
              Text(
                  '(${context.l10n.courseReviewSummaryFormattedReviewCount(totalReviews)})'),
            ],
          ),
          const SizedBox(height: Grid.one),
          Row(
            children: [
              Text(
                averageRating.ceil().format(),
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(width: Grid.two),
              RatingBarIndicator(
                direction: Axis.horizontal,
                itemCount: 5,
                rating: averageRating,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0),
              ),
              const Spacer(),
              Text(
                context.l10n.courseReviewSummaryRatingLevels,
                style: context.textTheme.bodyMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
