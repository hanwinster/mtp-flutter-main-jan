import 'package:domain/domain.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../../home.dart';
import '../../bloc/home_bloc/home_bloc.dart';
import 'components.dart';

class CourseCategoriesSection extends StatefulWidget {
  const CourseCategoriesSection({
    super.key,
    required this.onCourseCategoryClick,
  });

  final CourseCategoryClickCallback onCourseCategoryClick;

  @override
  State<CourseCategoriesSection> createState() =>
      _CourseCategoriesSectionState();
}

class _CourseCategoriesSectionState extends State<CourseCategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(text: context.l10n.homeLabelCourseCategories),
          _CourseCategories(
            onCourseCategoryClick: widget.onCourseCategoryClick,
          ),
        ],
      ),
    );
  }
}

class _CourseCategories extends StatelessWidget {
  const _CourseCategories({
    required this.onCourseCategoryClick,
  });

  final CourseCategoryClickCallback onCourseCategoryClick;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.courseCategoriesUiState.toView(
          context,
          successViewBuilder: (data) {
            return _CourseCategoryList(
              items: data,
              onCourseCategoryClick: onCourseCategoryClick,
            );
          },
          onRetried: () {
            context.read<HomeBloc>().add(const HomeCourseCategoriesFetched());
          },
        );
      },
    );
  }
}

class _CourseCategoryList extends StatefulWidget {
  const _CourseCategoryList({
    required this.items,
    required this.onCourseCategoryClick,
  });

  final CourseCategoryClickCallback onCourseCategoryClick;
  final List<CourseCategory> items;

  @override
  State<_CourseCategoryList> createState() => _CourseCategoryListState();
}

class _CourseCategoryListState extends State<_CourseCategoryList> {
  late PageController _pageController;
  final int itemWidth = 150;
  final int rows = 2;
  final int columns = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate how many items can fit in a row based on available width.
        int columns = (constraints.maxWidth / itemWidth).floor();

        // Show all items in two rows if space allows
        if (columns >= widget.items.length ~/ 2) {
          return Column(
            children: [
              _buildTwoRowLayout(widget.items),
            ],
          );
        } else {
          // Show 2 rows x 2 columns with pagination if space doesn't allow all items to fit
          return Column(
            children: [
              _buildExpandablePaginatedLayout(),
              const SizedBox(height: Grid.one),
              _buildPageIndicator(),
            ],
          );
        }
      },
    );
  }

  Widget _buildTwoRowLayout(List<CourseCategory> categories) {
    // Dynamically divide categories across two rows
    int halfLength = (categories.length / 2).ceil();
    List<Widget> firstRowItems = categories
        .take(halfLength)
        .map((category) => _buildCategoryItem(category))
        .toList();
    List<Widget> secondRowItems = categories
        .skip(halfLength)
        .map((category) => _buildCategoryItem(category))
        .toList();

    // Ensure that both rows have an equal number of items by filling with empty containers if necessary
    while (firstRowItems.length < secondRowItems.length) {
      firstRowItems.add(IntrinsicHeight(child: Container()));
    }
    while (secondRowItems.length < firstRowItems.length) {
      secondRowItems.add(IntrinsicHeight(child: Container()));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      // Wrap content based on the size of the items
      children: [
        IntrinsicHeight(
          // Ensure that all children in the row expand to the height of the tallest child
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                firstRowItems.map((item) => Expanded(child: item)).toList(),
          ),
        ),
        const SizedBox(height: 16), // Add some space between rows
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                secondRowItems.map((item) => Expanded(child: item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandablePaginatedLayout() {
    // Paginated layout: 2 rows and 2 columns per page using ExpandablePageView
    int totalPages = (widget.items.length / (rows * columns)).ceil();

    List<Widget> pages = List.generate(totalPages, (pageIndex) {
      int startIndex = pageIndex * rows * columns;
      int endIndex = startIndex + (rows * columns);
      List<CourseCategory> pageItems = widget.items.sublist(startIndex,
          endIndex > widget.items.length ? widget.items.length : endIndex);

      // Ensure each row has the correct number of items by filling remaining cells with empty containers
      List<Widget> firstRowItems = pageItems
          .take(columns)
          .map((category) => _buildCategoryItem(category))
          .toList();
      List<Widget> secondRowItems = pageItems
          .skip(columns)
          .take(columns)
          .map((category) => _buildCategoryItem(category))
          .toList();

      while (firstRowItems.length < columns) {
        firstRowItems.add(Container());
      }
      while (secondRowItems.length < columns) {
        secondRowItems.add(Container());
      }

      return Table(
        columnWidths: {
          for (int i = 0; i < columns; i++) i: const FlexColumnWidth(1),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
        children: [
          TableRow(
            children: firstRowItems,
          ),
          TableRow(
            children: secondRowItems,
          ),
        ],
      );
    });

    return ExpandablePageView(
      controller: _pageController,
      children: pages,
    );
  }

  Widget _buildPageIndicator() {
    int totalPages = (widget.items.length / (rows * columns)).ceil();

    return SmoothPageIndicator(
      controller: _pageController,
      count: totalPages,
      effect: WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: context.colorScheme.primary,
        dotColor: context.colorScheme.surfaceContainerHighest,
      ),
    );
  }

  Widget _buildCategoryItem(CourseCategory category) {
    return Material(
      child: Ink(
        child: InkWell(
          onTap: () => widget.onCourseCategoryClick(category: category),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(Grid.one),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        context.colorScheme.surfaceContainerHighest
                            .withOpacity(0.8),
                        context.colorScheme.surfaceContainerHighest
                            .withOpacity(0.6),
                        context.colorScheme.surfaceContainerHighest
                            .withOpacity(0.4),
                        context.colorScheme.surfaceContainerHighest
                            .withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: MtpAssets.images.category.image(
                    width: 20,
                    height: 20,
                    color: context.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: Grid.one),
                Expanded(
                  child: Text(
                    category.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
