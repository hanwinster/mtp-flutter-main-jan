import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/group_rule_bloc.dart';
import 'group_rule_screen.dart';

class GroupRuleScreenEntry extends StatelessWidget {
  final String groupId;

  const GroupRuleScreenEntry({
    super.key,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupRuleBloc(
        groupId: groupId,
      )..add(const GroupRuleFetched()),
      child: const GroupRuleScreen(),
    );
  }
}
