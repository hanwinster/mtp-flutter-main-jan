import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ui/ui.dart';

extension DecimalExtension on Decimal {
  String formatWith(NumberFormat formatter) =>
      formatter.format(DecimalIntl(this));

  String asMoneyString(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: context.locale);
    return formatter.format(DecimalIntl(this));
  }
}
