import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group/group_rule/components/group_rule_content.dart';
import 'package:ui/ui.dart';
import 'bloc/group_rule_bloc.dart';

class GroupRuleScreen extends StatelessWidget {
  const GroupRuleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupRuleBloc, GroupRuleState>(
      listenWhen: (previous, current) =>
          previous.groupJoiningUiState != current.groupJoiningUiState,
      listener: (context, state) {
        if (state.groupJoiningUiState is UiStateSuccess) {
          showSnackBar(
            context,
            "Successfully sent join request.",
          );
          Navigator.pop(context, true);
        } else if (state.groupJoiningUiState is UiStateFailure) {
          showSnackBar(
            context,
            state.groupJoiningUiState.messageOrEmpty(context),
          );
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.groupLabelRule),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: BlocBuilder<GroupRuleBloc, GroupRuleState>(
            buildWhen: (previous, current) =>
                previous.groupRuleUiState != current.groupRuleUiState,
            builder: (context, state) {
              return state.groupRuleUiState.toView(
                context,
                successViewBuilder: (rule) {
                  return GroupRuleContent(
                    groupId: state.groupId,
                    rule: rule,
                  );
                },
              );
            },
          )),
    );
  }
}
