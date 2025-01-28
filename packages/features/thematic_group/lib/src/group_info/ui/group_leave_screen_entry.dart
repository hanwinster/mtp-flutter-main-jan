import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_list/models/models.dart';

import '../../group_home/ui/group_home_screen_entry.dart';
import '../bloc/group_info_bloc.dart';
import 'group_leave_info_screen.dart';

typedef LeaveGroupCallback = void Function({
  required String groupId,
});

class GroupLeaveInfoScreenEntry extends StatelessWidget {
  const GroupLeaveInfoScreenEntry({
    super.key,
    required this.group,
    required this.groupType,
    required this.onGroupTapped,
    required this.onCancelClicked,
    required this.warnType
  });

  final ThematicGroupListing group;
  final GroupType groupType;

  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onCancelClicked;
  final String warnType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupInfoBloc(
        group: group,
        groupType: groupType,
      )..add(const GroupInfoAuthStateFetched()),
      child: GroupLeaveInfoScreen(
        onGroupTapped: onGroupTapped,
        onCancelClicked: onCancelClicked,
        warnType: warnType,
      ),
    );
  }
}
