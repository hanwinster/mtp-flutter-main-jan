import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_list/ui/group_list_screen.dart';
import 'package:thematic_group/thematic_group.dart';
import 'package:ui/ui.dart';

import '../../group_filter/ui/group_filter_screen_entry.dart';
import '../../group_list/bloc/bloc.dart';
import '../../group_list/models/models.dart';
import '../bloc/group_home_bloc.dart';
import 'package:badges/badges.dart' as badges;

class GroupHomeScreen extends StatelessWidget {
  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onLoginClicked;
  final NotificationActionClickCallback onNotiClick;

  const GroupHomeScreen({
    super.key,
    required this.drawer,
    required this.scaffoldKey,
    required this.onGroupTapped,
    required this.onLoginClicked,
    required this.onNotiClick,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer,
        appBar: buildMtpPrimaryAppBar(
          context,
          scaffoldKey,
          actions: [
            NotificationActionButton(
              onClicked: onNotiClick,
            ),
            BlocBuilder<GroupHomeBloc, GroupHomeState>(
              buildWhen: (previous, current) =>
                  previous.selectedCategories != current.selectedCategories,
              builder: (context, state) {
                return IconButton(
                  onPressed: () async {
                    await _showFilterBottomSheet(context);
                  },
                  icon: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 0, end: 0),
                    showBadge: state.selectedCategories.isNotEmpty,
                    child: Icon(
                      Icons.filter_alt,
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Grid.two,
          ),
          child: Column(
            children: [
              const SizedBox(height: Grid.two),
              _buildTabBar(context),
              const SizedBox(height: Grid.two),
              Expanded(
                child: TabBarView(children: [
                  BlocProvider(
                    create: (context) => GroupListBloc(
                      pageName: GroupPageName.myGroups,
                    ),
                    child: GroupListScreen(
                      groupType: GroupType.myGroups,
                      onGroupTapped: onGroupTapped,
                      onLoginClicked: onLoginClicked,
                    ),
                  ),
                  BlocProvider(
                    create: (context) => GroupListBloc(
                      pageName: GroupPageName.recommended,
                    ),
                    child: GroupListScreen(
                      groupType: GroupType.recommended,
                      onGroupTapped: onGroupTapped,
                      onLoginClicked: onLoginClicked,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(Grid.one + 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Grid.one),
        child: TabBar(
          onTap: (value) {},
          indicatorColor: Colors.black,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicator: const BoxDecoration(color: Colors.blue),
          tabs: [
            Tab(text: context.l10n.groupLabelMyGroups),
            Tab(text: context.l10n.groupLabelRecommended),
          ],
        ),
      ),
    );
  }

  Future<void> _showFilterBottomSheet(BuildContext context) async {
    final bloc = context.read<GroupHomeBloc>();
    final result = await showModalBottomSheet<List<ThematicGroupCategory>?>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return GroupFilterScreenEntry(
          selectedCategories: bloc.state.selectedCategories,
        );
      },
    );

    if (!context.mounted) return;
    if (result == null) return;

    context.read<GroupHomeBloc>().add(
          GroupHomeCategoriesChanged(result),
        );
  }
}
