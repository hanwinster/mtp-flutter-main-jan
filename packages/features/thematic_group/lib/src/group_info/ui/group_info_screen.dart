import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group/group_rule/group_rule_screen_entry.dart';
import 'package:thematic_group/src/group_info/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../../common/common.dart';
import '../../group_home/ui/group_home_screen_entry.dart';
import '../bloc/group_info_bloc.dart';

class GroupInfoScreen extends StatelessWidget {
  const GroupInfoScreen({
    super.key,
    required this.onGroupTapped,
    required this.onLoginClicked,
  });

  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onLoginClicked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupInfoBloc, GroupInfoState>(
      buildWhen: (previous, current) =>
          previous.group != current.group ||
          previous.authState != current.authState,
      builder: (context, state) {
        final authState = state.authState;
        final isLoggedIn = authState.isLoggedIn;
        final group = state.group;
        final isPrivate = group.isPrivate;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GroupCover(coverImageUrl: group.coverImages),
                const SizedBox(height: Grid.two),
                Column(
                  children: [
                    Text(
                      group.title,
                      style: context.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Grid.two),
                    Text(
                      group.description,
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: Grid.two),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: _InfoTag(
                              iconData: Icons.group,
                              text: context.l10n.groupLabelFormattedMemberCount(
                                  group.numberOfMembers),
                            ),
                          ),
                        ),
                        const SizedBox(width: Grid.two),
                        Expanded(
                          child: Center(
                            child: _InfoTag(
                              iconData: Icons.menu_book_rounded,
                              text: group.categories
                                  .map((e) => e.name)
                                  .join(", "),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isPrivate && group.sentRequest && !group.joined) ...[
                      const SizedBox(height: Grid.two),
                      InfoView(
                        iconData: Icons.check_circle,
                        iconColor: Colors.green,
                        infoText: context.l10n.groupLabelRequestSentMessage,
                      ),
                    ],
                    const SizedBox(height: 20),
                    isLoggedIn
                        ? isPrivate
                            ? group.joined
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: _LeaveGroupButton(
                                          groupId: group.id.toString(),
                                        ),
                                      ),
                                      const SizedBox(width: Grid.one),
                                      Expanded(
                                        child: _ViewGroupButton(onPressed: () {
                                          Navigator.pop(context);
                                          onGroupTapped(group);
                                        }),
                                      ),
                                    ],
                                  )
                                : group.sentRequest
                                    ? const SizedBox(
                                        width: double.infinity,
                                        child: _BackButton(),
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: _JoinPrivateGroupButton(
                                          groupId: group.id.toString(),
                                        ),
                                      )
                            : group.joined
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: _LeaveGroupButton(
                                          groupId: group.id.toString(),
                                        ),
                                      ),
                                      const SizedBox(width: Grid.one),
                                      Expanded(
                                        child: _ViewGroupButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            onGroupTapped(group);
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                        child: _ViewGroupButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            onGroupTapped(group);
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: _JoinPublicGroupButton(
                                          groupId: group.id.toString(),
                                        ),
                                      ),
                                    ],
                                  )
                        : const SizedBox(
                            width: double.infinity,
                            child: _LoginButton(),
                          )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InfoTag extends StatelessWidget {
  const _InfoTag({
    required this.iconData,
    required this.text,
  });

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: context.colorScheme.primary,
          size: 16,
        ),
        const SizedBox(width: Grid.one),
        Flexible(
          child: Text(
            text,
            style: context.textTheme.labelSmall,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _LeaveGroupButton extends StatelessWidget {
  const _LeaveGroupButton({
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GroupInfoBloc, GroupInfoState>(
          listenWhen: (previous, current) =>
              previous.groupLeavingUiState != current.groupLeavingUiState,
          listener: (context, state) {
            final groupLeavingUiState = state.groupLeavingUiState;
            if (groupLeavingUiState.isSuccess) {
              showSnackBar(context, groupLeavingUiState.dataOrNull ?? '');
              Navigator.pop(context, true);
            }
          },
        )
      ],
      child: BlocBuilder<GroupInfoBloc, GroupInfoState>(
          buildWhen: (previous, current) =>
              previous.groupLeavingUiState != current.groupLeavingUiState,
          builder: (context, state) {
            final isInProgress = state.groupLeavingUiState.isInProgress;
            return MtpOutlinedSubmitButton(
              isInProgress: isInProgress,
              labelText: context.l10n.groupButtonTextLeaveGroup,
              onPressed: () {
                context
                    .read<GroupInfoBloc>()
                    .add(GroupInfoLeaveGroupRequested(groupId));
              },
            );
          }),
    );
  }
}

class _ViewGroupButton extends StatelessWidget {
  const _ViewGroupButton({
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MtpPrimaryButton(
      onPressed: onPressed,
      labelText: context.l10n.groupButtonTextViewGroup,
    );
  }
}

class _JoinPublicGroupButton extends StatelessWidget {
  const _JoinPublicGroupButton({required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GroupInfoBloc, GroupInfoState>(
          listenWhen: (previous, current) =>
              previous.groupJoiningUiState != current.groupJoiningUiState,
          listener: (context, state) {
            final groupJoiningUiState = state.groupJoiningUiState;
            if (groupJoiningUiState.isSuccess) {
              Navigator.pop(context, true);
            }
          },
        )
      ],
      child: BlocBuilder<GroupInfoBloc, GroupInfoState>(
        buildWhen: (previous, current) =>
            previous.groupJoiningUiState != current.groupJoiningUiState,
        builder: (context, state) {
          final isInProgress = state.groupJoiningUiState.isInProgress;
          return MtpPrimarySubmitButton(
            isInProgress: isInProgress,
            onPressed: () {
              // context
              //     .read<GroupInfoBloc>()
              //     .add(GroupInfoJoinGroupRequested(groupId));
              _showGroupRule(context);
            },
            labelText: context.l10n.groupButtonTextJoinGroup,
          );
        },
      ),
    );
  }

  Future<void> _showGroupRule(BuildContext context) async {
    final joined = await showDialog<bool?>(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: GroupRuleScreenEntry(
            groupId: groupId,
          ),
        );
      },
    );
    if (!context.mounted) return;
    if (joined == true) {
      Navigator.pop(context, true);
    }
  }
}

class _JoinPrivateGroupButton extends StatelessWidget {
  const _JoinPrivateGroupButton({
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return MtpPrimaryButton(
      onPressed: () {
        _showGroupRule(context);
      },
      labelText: context.l10n.groupButtonTextRequestToJoin,
    );
  }

  Future<void> _showGroupRule(BuildContext context) async {
    final joined = await showDialog<bool?>(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: GroupRuleScreenEntry(
            groupId: groupId,
          ),
        );
      },
    );
    if (!context.mounted) return;
    if (joined == true) {
      Navigator.pop(context, true);
    }
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return MtpPrimaryButton(
      onPressed: () {
        // onLoginClicked
      },
      labelText: context.l10n.loginButtonTextLoggingIn,
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return MtpPrimaryButton(
      onPressed: () {
        Navigator.pop(
          context,
        );
      },
      labelText: context.l10n.groupButtonTextBack,
    );
  }
}
