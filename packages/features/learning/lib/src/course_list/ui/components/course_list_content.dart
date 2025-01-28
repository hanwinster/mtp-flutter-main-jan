import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:learning/learning.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import 'components.dart';

class CourseListContent extends StatefulWidget {
  const CourseListContent({
    super.key,
    required this.onCourseItemEvent,
  });

  final CourseItemEventHandler onCourseItemEvent;

  @override
  State<CourseListContent> createState() => _CourseListContentState();
}

class _CourseListContentState extends State<CourseListContent> {
  final PagingControllerExtent<int, Course> _pagingController =
      PagingControllerExtent(firstPageKey: firstPageKey);
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      logger.d('_pagingController: pageKey: $pageKey');
      context
          .read<CourseListBloc>()
          .add(CourseListCoursesFetched(pageKey: pageKey));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchInput(),
        const SizedBox(height: Grid.two),
        Expanded(
          child: MultiBlocListener(
            listeners: [
              BlocListener<CourseListBloc, CourseListState>(
                listenWhen: (previous, current) {
                  return previous.filter.keyword != current.filter.keyword;
                },
                listener: (context, state) {
                  _pagingController.refresh();
                },
              ),
              BlocListener<CourseListBloc, CourseListState>(
                listenWhen: (previous, current) {
                  return previous.coursesUiState != current.coursesUiState;
                },
                listener: (context, state) {
                  if (state.coursesUiState.isSuccess) {
                    final newItems = state.coursesUiState.dataOrNull ?? [];
                    if (state.isLastPage) {
                      _pagingController.appendLastPage(newItems);
                    } else {
                      _pagingController.appendPage(newItems, state.nextPageKey);
                    }

                    if (_refreshController.isRefresh) {
                      _refreshController.refreshCompleted();
                    }
                  } else if (state.coursesUiState.isFailure) {
                    _pagingController.error =
                        state.coursesUiState.errorOrNull(context);
                    if (_refreshController.isRefresh) {
                      _refreshController.refreshFailed();
                    }
                  }
                },
              ),
            ],
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: false,
              onRefresh: () {
                _pagingController.refresh();
              },
              child: PagedListView<int, Course>.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: Grid.half),
                padding: const EdgeInsets.only(bottom: Grid.one),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Course>(
                  itemBuilder: (context, item, index) => CourseListItemView(
                    index: index,
                    item: item,
                    onTap: () => widget.onCourseItemEvent(courseId: item.id),
                  ),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: MtpLoading(center: true)),
                  noItemsFoundIndicatorBuilder: (context) => Center(
                    child: Text(context.l10n.homeLabelNoCourses),
                  ),
                  firstPageErrorIndicatorBuilder: (context) => Center(
                    child: Text(_pagingController.error.toString()),
                  ),
                  newPageErrorIndicatorBuilder: (context) => Center(
                    child: Text(_pagingController.error.toString()),
                  ),
                  newPageProgressIndicatorBuilder: (context) => const Center(
                    child: MtpLoading(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _refreshController.dispose();
    super.dispose();
  }
}
