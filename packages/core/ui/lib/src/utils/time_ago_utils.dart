import 'package:timeago/timeago.dart';

class TimeAgoMyMessages implements LookupMessages {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'က';

  @override
  String suffixFromNow() => 'မှစ၍';

  @override
  String lessThanOneMinute(int seconds) => 'ယခုလေးတင်';

  @override
  String aboutAMinute(int minutes) => 'မိနစ်လေး';

  @override
  String minutes(int minutes) => '$minutes မိနစ်';

  @override
  String aboutAnHour(int minutes) => 'နာရီလောက်';

  @override
  String hours(int hours) => '$hours နာရီ';

  @override
  String aDay(int hours) => 'တစ်နေ့';

  @override
  String days(int days) => '$days ရက်';

  @override
  String aboutAMonth(int days) => 'လလောက်';

  @override
  String months(int months) => '$months လ';

  @override
  String aboutAYear(int year) => 'နှစ်လောက်';

  @override
  String years(int years) => '$years နှစ်';

  @override
  String wordSeparator() => ' ';
}