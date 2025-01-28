import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_info/ui/components/components.dart';
import 'package:thematic_group/src/group_list/models/group_type.dart';
import 'package:ui/ui.dart';

import '../../group_home/ui/group_home_screen_entry.dart';
import '../bloc/group_info_bloc.dart';
import 'group_leave_screen_entry.dart';

class GroupLeaveInfoScreen extends StatelessWidget {
  const GroupLeaveInfoScreen({
    super.key,
    required this.onGroupTapped,
    required this.onCancelClicked,
    required this.warnType,
  });

  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onCancelClicked;
  final String warnType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupInfoBloc, GroupInfoState>(
      buildWhen: (previous, current) =>
          previous.group != current.group ||
          previous.authState != current.authState,
      builder: (context, state) {
        final group = state.group;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (warnType.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(null),
                      Text(
                        context.l10n.groupLabelWarning,
                        style: context.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close))
                    ],
                  ),
                const SizedBox(height: Grid.two),
                warnType.isEmpty
                    ? GroupCover(coverImageUrl: group.coverImages)
                    : MtpAssets.images.thematicWarningImage
                        .image(width: 117, height: 100),
                const SizedBox(height: Grid.two),
                Column(
                  children: [
                    if (warnType.isEmpty)
                      Text(
                        group.title,
                        style: context.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: Grid.two),
                    Text(
                      warnType.isEmpty
                          ? context.l10n.groupWarningLeave
                          : context.l10n.groupWarningDelete,
                      //context.l10n.groupButtonTextBack
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: Grid.two),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: _BackButton(
                          label: warnType.isEmpty
                              ? context.l10n.settingsCancel
                              : context.l10n.groupButtonTextKeepPostAndLeave,
                        )),
                        const SizedBox(width: Grid.one),
                        Expanded(
                          child: warnType.isEmpty
                              ? _LeaveButton(
                                  group: group,
                                  label: warnType,
                                )
                              : _LeaveGroupButton(groupId: group.id, label: ''),
                        ),
                      ],
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

class _LeaveGroupButton extends StatelessWidget {
  const _LeaveGroupButton({required this.groupId, required this.label});

  final String groupId;
  final String label;

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
              Navigator.pop(context);
              Navigator.pop(context);
            }
          },
        )
      ],
      child: BlocBuilder<GroupInfoBloc, GroupInfoState>(
        buildWhen: (previous, current) =>
            previous.groupLeavingUiState != current.groupLeavingUiState,
        builder: (context, state) {
          final isInProgress = state.groupLeavingUiState.isInProgress;
          return MtpWarningSubmitButton(
            isInProgress: isInProgress,
            labelText: context.l10n.groupButtonTextDeletePostAndLeave,
            onPressed: () {
              context
                  .read<GroupInfoBloc>()
                  .add(GroupInfoLeaveGroupRequested(groupId));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE36363), // Background color
            ),
          );
        },
      ),
    );
  }
}

class _LeaveButton extends StatelessWidget {
  const _LeaveButton({required this.group, required this.label});

  final ThematicGroupListing group;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MtpWarningButton(
      labelText: label.isEmpty
          ? context.l10n.groupButtonTextLeaveGroup
          : context.l10n.groupButtonTextDeletePostAndLeave, //
      onPressed: () async {
        if (label.isEmpty) {
          Navigator.pop(
            context,
          );
          await showModalBottomSheet<bool?>(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            builder: (context) {
              return GroupLeaveInfoScreenEntry(
                  group: group,
                  onCancelClicked: () {},
                  onGroupTapped: (ThematicGroupListing lsiting) {},
                  groupType: GroupType.myGroups,
                  warnType: 'keep');
            },
          );
        } else {
          context
              .read<GroupInfoBloc>()
              .add(GroupInfoLeaveGroupRequested(group.id.toString()));
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffE36363), // Background color
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return MtpOutlinedSubmitButton(
      isInProgress: false,
      labelText: label, //context.l10n.groupButtonTextBack
      onPressed: () {
        Navigator.pop(
          context,
        );
      },
    );
  }
}
