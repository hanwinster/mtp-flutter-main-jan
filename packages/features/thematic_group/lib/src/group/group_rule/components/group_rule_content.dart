import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/group_rule_bloc.dart';

class GroupRuleContent extends StatelessWidget {
  const GroupRuleContent({
    super.key,
    required this.groupId,
    required this.rule,
  });

  final String groupId;
  final ThematicGroupRulesResponse rule;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rule.details.title,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            Text(
              rule.details.description,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16.0),
            Text(
              rule.details.behaviorRules,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            _buildRulesSections(rule.details.rules, context),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const Expanded(
                    child: _CancelButton(),
                  ),
                  const SizedBox(width: Grid.one),
                  Expanded(
                    child: _JoinPrivateGroupButton(
                      groupId: groupId,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRulesSections(
      List<ThematicRuleSection> sections, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.map((section) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section.title,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildRuleItems(section.ruleItems, context),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildRuleItems(List<ThematicRuleItem> items, BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "${item.id} ${item.description}",
            style: context.textTheme.bodyMedium,
          ),
        );
      }).toList(),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton();

  @override
  Widget build(BuildContext context) {
    return MtpOutlinedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      labelText: "Cancel",
    );
  }
}

class _JoinPrivateGroupButton extends StatelessWidget {
  const _JoinPrivateGroupButton({
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupRuleBloc, GroupRuleState>(
      buildWhen: (previous, current) =>
          previous.groupJoiningUiState != current.groupJoiningUiState,
      builder: (context, state) {
        final isInProgress = state.groupJoiningUiState is UiStateInProgress;
        return MtpPrimarySubmitButton(
          isInProgress: isInProgress,
          onPressed: () {
            context.read<GroupRuleBloc>().add(
                  GroupRuleJoinGroupRequested(groupId),
                );
          },
          labelText: "Agree",
        );
      },
    );
  }
}
