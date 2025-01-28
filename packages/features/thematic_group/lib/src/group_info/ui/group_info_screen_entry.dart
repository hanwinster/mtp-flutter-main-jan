import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_list/models/models.dart';

import '../../group_home/ui/group_home_screen_entry.dart';
import '../bloc/group_info_bloc.dart';
import 'group_info_screen.dart';

typedef JoinGroupCallback = void Function({
  required String groupId,
});
typedef LeaveGroupCallback = void Function({
  required String groupId,
});

class GroupInfoScreenEntry extends StatelessWidget {
  const GroupInfoScreenEntry({
    super.key,
    required this.group,
    required this.groupType,
    required this.onGroupTapped,
    required this.onLoginClicked,

  });

  final ThematicGroupListing group;
  final GroupType groupType;

  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onLoginClicked;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupInfoBloc(
        group: group,
        groupType: groupType,
      )..add(const GroupInfoAuthStateFetched()),
      child: GroupInfoScreen(
        onGroupTapped: onGroupTapped,
        onLoginClicked: onLoginClicked,
      ),
    );
  }
}
