import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/src/noti_list/bloc/noti_list_bloc.dart';
import 'package:notification/src/noti_list/ui/components/noti_list_view.dart';
import 'package:notification/src/noti_list/ui/noti_list_screen_entry.dart';
import 'package:ui/ui.dart';

class NotiListScreen extends StatefulWidget {
  const NotiListScreen({
    super.key,
    required this.onNotiItemEvent,
  });

  final NotiItemEventHandler onNotiItemEvent;

  @override
  State<NotiListScreen> createState() => _NotiListScreenState();
}

class _NotiListScreenState extends State<NotiListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.notificationList),
        bottom: TabBar(
          controller: _tabController,
          labelColor: context.colorScheme.primary,
          unselectedLabelColor: Colors.grey,
          // Color for unselected tabs
          indicatorColor: Colors.blue,
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.l10n.notiLabelUnread),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const _UnreadCount(),
                  ),
                ],
              ),
            ),
            Tab(
              child: Text(context.l10n.notiLabelRead),
            ),
          ],
        ),
      ),
      body: BlocBuilder<NotiListBloc, NotiListState>(
        buildWhen: (previous, current) =>
            previous.notiListUiState != current.notiListUiState,
        builder: (context, state) {
          return state.notiListUiState.toView(
            context,
            successViewBuilder: (items) {
              List<NotificationItem> unreadNotifications = items
                  .paginatedNotiList.data
                  .where((noti) => noti.readAt == null)
                  .toList();
              List<NotificationItem> readNotifications = items
                  .paginatedNotiList.data
                  .where((noti) => noti.readAt != null)
                  .toList();

              return TabBarView(
                controller: _tabController,
                children: [
                  unreadNotifications.isNotEmpty
                      ? NotiListView(
                          items: unreadNotifications,
                          onNotiItemEvent: widget.onNotiItemEvent,
                        )
                      : Center(child: Text(context.l10n.notiLabelNoUnread)),
                  // Read Notifications View
                  NotiListView(
                    items: readNotifications,
                    onNotiItemEvent: widget.onNotiItemEvent,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _UnreadCount extends StatelessWidget {
  const _UnreadCount();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotiListBloc, NotiListState>(
      buildWhen: (previous, current) =>
          previous.notiListUiState != current.notiListUiState,
      builder: (context, state) {
        // final data = state.notiListUiState.dataOrNull;

        return state.notiListUiState.toView(
          context,
          loadingViewBuilder: (items) {
            return const SizedBox();
          },
          successViewBuilder: (items) {
            List<NotificationItem> unreadNotifications = items
                .paginatedNotiList.data
                .where((noti) => noti.readAt == null)
                .toList();

            return unreadNotifications.isEmpty
                ? const SizedBox()
                : Text(
                    unreadNotifications.length.format(context.locale),
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
          },
        );
      },
    );
  }
}
