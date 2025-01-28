import 'package:design_system/design_system.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'buttons.dart';
import 'text_fields.dart';
import 'phone_fields.dart';

List<Story> getStories(MtpThemeData theme) {
  return [
    ...getButtonStories(theme),
    ...getTextFieldStories(theme),
    ...getPhoneFieldStories(theme),
  ];
}
