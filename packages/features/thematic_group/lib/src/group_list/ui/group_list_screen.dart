import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_home/bloc/bloc.dart';
import '../../group_home/ui/group_home_screen_entry.dart';
import '../bloc/bloc.dart';
import '../models/models.dart';
import 'components/components.dart';

class GroupListScreen extends StatefulWidget {
  const GroupListScreen({
    super.key,
    required this.groupType,
    required this.onGroupTapped,
    required this.onLoginClicked,
  });

  final GroupType groupType;
  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onLoginClicked;

  @override
  State<GroupListScreen> createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen>
    with AutomaticKeepAliveClientMixin<GroupListScreen> {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<GroupHomeBloc, GroupHomeState>(
      listenWhen: (previous, current) =>
          previous.selectedCategories != current.selectedCategories,
      listener: (context, state) {
        context.read<GroupListBloc>().add(
              GroupListCategoriesChanged(state.selectedCategories),
            );
      },
      child: GroupListContent(
        groupType: widget.groupType,
        onGroupTapped: widget.onGroupTapped,
        onLoginClicked: widget.onLoginClicked,
      ),
    );
  }
}
