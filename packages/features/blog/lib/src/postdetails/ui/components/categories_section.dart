import 'package:blog/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/post_details_bloc.dart';
import 'components.dart';

class CategoriesSliverSection extends StatelessWidget {
  const CategoriesSliverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      buildWhen: (previous, current) =>
          previous.categoriesUiState != current.categoriesUiState,
      builder: (context, state) {
        return state.categoriesUiState.toSliverView(
          context,
          loadingViewBuilder: () {
            return const CategoriesSliverSectionPlaceholder();
          },
          successViewBuilder: (items) {
            return SliverList(
              delegate: SliverChildListDelegate(
                [
                  SectionHeader(text: context.l10n.postLabelSubtitleCategories),
                  const SizedBox(height: Grid.two),
                  CategoryListView(
                    items: items,
                    onCategoryTapped: (item) {
                      context
                          .read<PostDetailsBloc>()
                          .add(PostDetailsCategoryToggled(item));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
