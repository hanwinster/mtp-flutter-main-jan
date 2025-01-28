import 'package:intl/intl.dart';

extension DoubleFormatter on double {
  String format([String? locale]) {
    final f = NumberFormat.decimalPattern(locale ?? 'en_US');
    return f.format(this);
  }
}
