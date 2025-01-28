import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thematic_group/src/group_info/bloc/bloc.dart';
import 'package:ui/ui.dart';

import '../../../group_home/ui/group_home_screen_entry.dart';
import '../../bloc/bloc.dart';
import '../../models/models.dart';
import 'components.dart';

class GroupListContent extends StatefulWidget {
  const GroupListContent({
    super.key,
    required this.groupType,
    required this.onGroupTapped,
    required this.onLoginClicked,
  });

  final GroupType groupType;
  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onLoginClicked;

  @override
  State<GroupListContent> createState() => _GroupListContentState();
}

class _GroupListContentState extends State<GroupListContent> {
  final PagingControllerExtent<int, ThematicGroupListing> _pagingController =
      PagingControllerExtent(firstPageKey: firstPageKey);
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late StreamSubscription _groupUpdateSubscription;
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      logger.d('_pagingController: pageKey: $pageKey');
      context.read<GroupListBloc>().add(GroupListFetched(pageKey: pageKey));
    });
    _setupGroupUpdateListener();
  }

  void _setupGroupUpdateListener() {
    _groupUpdateSubscription = GroupUpdateService().groupUpdates.listen((_) {
      // Refresh the list when a group update is received
      _pagingController.refresh();
    });
  }

  @override
  void dispose() {
    _groupUpdateSubscription.cancel();
    _pagingController.dispose();
    _refreshController.dispose();
    super.dispose();
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
              BlocListener<GroupListBloc, GroupListState>(
                listenWhen: (previous, current) {
                  return previous.filter != current.filter;
                },
                listener: (context, state) {
                  _pagingController.refresh();
                },
              ),
              BlocListener<GroupListBloc, GroupListState>(
                listenWhen: (previous, current) {
                  return previous.groupsUiState != current.groupsUiState;
                },
                listener: (context, state) {
                  if (state.groupsUiState.isSuccess) {
                    final newItems = state.groupsUiState.dataOrNull ?? [];
                    if (state.isLastPage) {
                      _pagingController.appendLastPage(newItems);
                    } else {
                      _pagingController.appendPage(newItems, state.nextPageKey);
                    }

                    if (_refreshController.isRefresh) {
                      _refreshController.refreshCompleted();
                    }
                  } else if (state.groupsUiState.isFailure) {
                    _pagingController.error =
                        state.groupsUiState.errorOrNull(context);
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
              child: PagedListView<int, ThematicGroupListing>.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: Grid.two),
                padding: const EdgeInsets.only(bottom: Grid.two),
                pagingController: _pagingController,
                builderDelegate:
                    PagedChildBuilderDelegate<ThematicGroupListing>(
                  itemBuilder: (context, group, index) => GroupListTile(
                    group: group,
                    groupType: widget.groupType,
                    onGroupTapped: widget.onGroupTapped,
                    iconData: Icons.group,
                    iconData2:
                        group.privacy == "private" ? Icons.lock : Icons.public,
                    onLoginClicked: widget.onLoginClicked,
                    onForceRefresh: () {
                      _pagingController.refresh();
                    },
                  ),
                  noItemsFoundIndicatorBuilder: (context) =>
                      Center(child: Text(context.l10n.groupLabelEmptyGroup)),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: MtpLoading(center: true)),
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
}
