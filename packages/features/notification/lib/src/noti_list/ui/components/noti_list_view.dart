import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/src/noti_list/ui/noti_list_screen_entry.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ui/ui.dart';

import '../../bloc/noti_list_bloc.dart';
import 'noti_list_item_view.dart';

class NotiListView extends StatefulWidget {
  const NotiListView({
    super.key,
    required this.items,
    required this.onNotiItemEvent,
  });

  final List<NotificationItem> items;
  final NotiItemEventHandler onNotiItemEvent;

  @override
  State<NotiListView> createState() => _NotiListViewState();
}

class _NotiListViewState extends State<NotiListView> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  final ScrollController _scrollController = ScrollController();

  void onRefresh() async {
    context.read<NotiListBloc>().add(const NotiListFetched());
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      scrollController: _scrollController,
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.two,
          vertical: Grid.two,
        ),
        separatorBuilder: (context, index) =>
            const Divider(height: Grid.two, thickness: 1),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return NotiListItemView(
            item: item,
            onTap: () {
              print("noti id is : ${item.id}");
              widget.onNotiItemEvent(notiID: item.id);
            },
          );
        },
      ),
    );
  }
}
