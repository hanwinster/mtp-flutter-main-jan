import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:thematic_group/src/group_info/group_info.dart';
import 'package:ui/ui.dart';

import '../../../../thematic_group.dart';
import '../../../common/common.dart';
import '../../models/models.dart';

class GroupListTile extends StatelessWidget {
  final ThematicGroupListing group;
  final GroupType groupType;
  final IconData iconData, iconData2;
  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onLoginClicked;
  final Function() onForceRefresh;

  const GroupListTile({
    super.key,
    required this.groupType,
    required this.group,
    required this.iconData,
    required this.iconData2,
    required this.onGroupTapped,
    required this.onLoginClicked,
    required this.onForceRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (groupType == GroupType.myGroups) {
          onGroupTapped(group);
        } else {
          await _showGroupInfoDialog(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Grid.one),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MtpImage(
                group.coverImages.thumbnail,
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(
              width: Grid.two,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.title,
                    style: context.textTheme.titleMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: Grid.one,
                  ),
                  Row(
                    children: [
                      InfoView(
                          iconColor: context.colorScheme.primary,
                          iconData: iconData,
                          infoText: context.l10n.groupLabelFormattedMemberCount(
                              group.numberOfMembers)),
                      const SizedBox(width: Grid.two),
                      InfoView(
                        iconColor: context.colorScheme.primary,
                        iconData: iconData2,
                        infoText: group.privacy == 'private'
                            ? context.l10n.groupLabelPrivate
                            : context.l10n.groupLabelPublic,
                      )
                    ],
                  ),
                  const SizedBox(height: Grid.one),
                  Text(
                    group.description,
                    style: context.textTheme.bodyMedium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showGroupInfoDialog(BuildContext context) async {
    final requiredRefresh = await showModalBottomSheet<bool?>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return GroupInfoScreenEntry(
          group: group,
          onLoginClicked: onLoginClicked,
          onGroupTapped: onGroupTapped,
          groupType: groupType,
        );
      },
    );
    if (!context.mounted) return;
    if (requiredRefresh == true) {
      onForceRefresh();
    }
  }
}
