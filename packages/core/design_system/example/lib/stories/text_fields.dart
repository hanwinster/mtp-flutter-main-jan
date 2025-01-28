import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

List<Story> getTextFieldStories(MtpThemeData theme) {
  return [
    Story(
      name: 'Widgets/TextFields/Outline',
      description: 'Outline TextField',
      builder: (BuildContext context) {
        return MtpOutlineTextField(
          labelText: context.knobs.text(
            label: 'label',
            initial: 'Outline TextField Label',
          ),
          hintText: context.knobs.text(
            label: 'hint',
            initial: 'Input your text here',
          ),
        );
      },
    ),
  ];
}
