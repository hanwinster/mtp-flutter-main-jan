import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class DeleteAccountListTile extends StatelessWidget {
  const DeleteAccountListTile({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.l10n.settingsLabelDeleteAccount,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.error,
          )),
      leading: Icon(Icons.delete, color: context.colorScheme.error),
      trailing: const Icon(Icons.chevron_right),
      onTap: () async {
// Show a confirmation dialog when delete is tapped
        bool? confirmDelete = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // content: Text(context.l10n.settingsConfirmDeleteMessage, maxLines: null,),
              content: Text(
                context.l10n.settingsLabelDeleteAccount,
                maxLines: null,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Cancel
                  },
                  // child: Text(context.l10n.settingsCancel),
                  child: Text(context.l10n.courseButtonTextCancelCourseConfirm),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Confirm deletion
                  },
                  child: Text(context.l10n.settingsLabelDeleteAccount),
                ),
              ],
            );
          },
        );
        if (confirmDelete == true) {
          onPressed();
        }
      },
    );
  }
}
