import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui/ui.dart';

class CourseReviewTile extends StatelessWidget {
  const CourseReviewTile({
    super.key,
    required this.item,
  });

  final CourseReview item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Avatar(),
        const SizedBox(
          width: Grid.two,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      (item.user?.fullName ?? '').maskName,
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(width: Grid.two),
                  Text(
                    item.createdAt.asShortDate(context),
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ),
              if (item.rating > 0) ...[
                const SizedBox(height: Grid.half),
                RatingBarIndicator(
                  rating: item.rating,
                  direction: Axis.horizontal,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 16.0,
                ),
              ],
              if (item.remark.isNotEmpty) ...[
                const SizedBox(height: Grid.half),
                Text(
                  item.remark,
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: Grid.one),
      ],
    );
    // const SizedBox(
    // height: 5,
    // ),
    // RatingBar(
    // initialRating: datum.rating!.toDouble(),
    // direction: Axis.horizontal,
    // allowHalfRating: true,
    // ignoreGestures: true,
    // itemCount: 5,
    // itemSize: 12.r,
    // itemPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
    // ratingWidget: RatingWidget(
    // full: const Icon(
    // Icons.star,
    // color: MTPColors.starColor,
    // ),
    // half: const Icon(
    // Icons.star,
    // color: MTPColors.starColor,
    // ),
    // empty: const Icon(
    // Icons.star_border_outlined,
    // color: MTPColors.starColor,
    // )),
    // onRatingUpdate: (updated) {
    // onRatingUpdate(updated);
    // // setState(() {
    // //   rating = updated;
    // // });
    // },
    // ),
    // const SizedBox(
    // height: 10,
    // ),
    // Text(
    // datum.review!,
    // style: TextStyle(
    // fontSize: FontHelper.FONT_SIZE_NORMAL,
    // ),
    // ),
    // ],
    // ),
    // ),
    // ],
    // )}
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: context.colorScheme.primary.withOpacity(0.12),
          shape: BoxShape.circle),
      child: const Icon(Icons.person),
    );
  }
}
