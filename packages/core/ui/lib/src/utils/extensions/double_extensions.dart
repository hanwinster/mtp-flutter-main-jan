import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ui/ui.dart';

extension DoubleExtension on double {
  String asMoneyString(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: context.locale);
    return formatter.format(this);
  }
}
