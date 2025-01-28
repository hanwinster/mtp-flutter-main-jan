import 'package:base/base.dart';

enum CourseDurationUnit {
  second,
  minute,
  hour,
  day,
  week,
  month,
  year,
  unknown,
}

class CourseDuration extends Equatable {
  final int duration;
  final CourseDurationUnit unit;

  const CourseDuration({
    required this.duration,
    required this.unit,
  });

  @override
  List<Object> get props => [duration, unit];
}