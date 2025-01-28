import 'package:base/base.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class MyanmarDateTimeParser {
  /// Parses a Myanmar date time string and converts it to UTC.
  /// [dateTimeString] should be in a format like "yyyy-MM-dd HH:mm:ss".
  /// Returns a UTC DateTime object.
  static DateTime parseToUtc(String dateTimeString,
      [String pattern = 'dd/MM/yyyy HH:mm']) {
    try {
      // Get Myanmar timezone
      final myanmarTimeZone = tz.getLocation('Asia/Rangoon');

      // Parse the input as a tz.TZDateTime in the Myanmar timezone
      final DateTime localDateTime = DateFormat(pattern).parse(dateTimeString);
      final tz.TZDateTime myanmarDateTime = tz.TZDateTime(
        myanmarTimeZone,
        localDateTime.year,
        localDateTime.month,
        localDateTime.day,
        localDateTime.hour,
        localDateTime.minute,
      );

      // Convert the Myanmar time to UTC
      return myanmarDateTime.toUtc();
    } catch (e, s) {
      logger.e('Error parsing date time: $dateTimeString', e, s);
      return DateTime.now();
    }
  }
}
