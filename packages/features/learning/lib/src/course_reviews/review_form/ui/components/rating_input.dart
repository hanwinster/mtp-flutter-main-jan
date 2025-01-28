import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui/ui.dart';
import '../../bloc/bloc.dart';


class RatingInput extends StatelessWidget {
  const RatingInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewFormBloc, ReviewFormState>(
      buildWhen: (previous, current) =>
          previous.ratingState != current.ratingState ||
          previous.ratingError != current.ratingError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar(
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: Grid.half),
              ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  empty: const Icon(
                    Icons.star_border_outlined,
                    color: Colors.amber,
                  )),
              onRatingUpdate: (rating) {
                context.read<ReviewFormBloc>().add(ReviewFormRatingChanged(rating.toInt()));
              },
            ),
            if (state.ratingError != null)
              Padding(
                padding: const EdgeInsets.only(top: Grid.half),
                child: Text(
                  state.ratingError!.resolveErrorMessage(context),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.error,
                  ),
                ),
              ),
          ],
        );
        // return MtpOutlineTextField(
        //   labelText: context.l10n.registerLabelName,
        //   prefixIcon: const Icon(Icons.badge_outlined),
        //   textInputAction: TextInputAction.next,
        //   onSubmitted: (_) => onFieldSubmitted(),
        //   focusNode: focusNode,
        //   onChanged: (value) {
        //     context.read<ReviewFormBloc>().add(ReviewFormRatingChanged(value));
        //   },
        //   errorText: state.fullNameError?.resolveErrorMessage(context),
        // );
      },
    );
  }
}
