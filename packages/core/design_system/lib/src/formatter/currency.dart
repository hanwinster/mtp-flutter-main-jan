import 'package:intl/intl.dart';

extension DoubleToCurrency on double {
  String asCurrencyString({required String locale, String? symbol}) {
    final format = NumberFormat.currency(locale: locale, symbol: symbol);
    return format.format(this);
  }

  String asSimpleCurrencyString({required String locale, String? symbol}) {
    final format = NumberFormat.simpleCurrency(locale: locale);
    return format.format(this);
  }
}
