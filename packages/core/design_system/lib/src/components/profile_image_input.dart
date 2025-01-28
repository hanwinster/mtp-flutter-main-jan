import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localization/localization.dart';

class MtpProfileImageInput extends StatefulWidget {
  const MtpProfileImageInput({
    super.key,
    required this.imageUrl,
    required this.onImageUrlChanged,
    required this.onPickImageError,
    this.showRemoveButton = true,
  });

  final Uri? imageUrl;
  final Function(Uri?) onImageUrlChanged;
  final Function(dynamic) onPickImageError;
  final bool showRemoveButton;

  @override
  State<MtpProfileImageInput> createState() =>
      _MtpProfileImageInputState();
}

class _MtpProfileImageInputState
    extends State<MtpProfileImageInput> {
  final ImagePicker _picker = ImagePicker();

  void notifyImageAdded(XFile value) {
    final newImageUrl = Uri.file(value.path);
    widget.onImageUrlChanged(newImageUrl);
  }

  void notifyImageRemoved() {
    widget.onImageUrlChanged(null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(60), // Image radius
            child: widget.imageUrl == null
                ? const MtpImage(
                    '',
                    width: double.infinity,
                    height: double.infinity,
                  )
                : MtpImage.uri(
                    widget.imageUrl!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    showMessage: true,
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipOval(
            child: Material(
              shape: const CircleBorder(),
              child: InkWell(
                onTap: () => _showImageSourceActionSheet(context),
                child: Ink(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: context.colorScheme.onPrimary, width: 2),
                  ),
                  child: Icon(
                    Icons.add_a_photo,
                    color: context.colorScheme.onPrimary,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.imageUrl != null && widget.showRemoveButton)
          Positioned(
            right: 0,
            top: 0,
            child: ClipOval(
              child: Material(
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () => notifyImageRemoved(),
                  child: Ink(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: context.colorScheme.iconMediumEmphasis,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: context.colorScheme.onPrimary, width: 2),
                    ),
                    child: Icon(
                      Icons.clear,
                      color: context.colorScheme.onPrimary,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (!context.mounted) return;

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );
      if (pickedFile != null) {
        notifyImageAdded(pickedFile);
      }
    } catch (e) {
      widget.onPickImageError(e);
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BorderRadiusSize.normal),
          topRight: Radius.circular(BorderRadiusSize.normal),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(context.l10n.buttonTextChooseFromGallery),
              onTap: () {
                _onImageButtonPressed(
                  ImageSource.gallery,
                  context: context,
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(context.l10n.buttonTextTakePhoto),
              onTap: () {
                _onImageButtonPressed(
                  ImageSource.camera,
                  context: context,
                );
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
