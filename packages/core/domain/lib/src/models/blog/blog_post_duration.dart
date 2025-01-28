import 'package:base/base.dart';

enum BlogPostDurationUnit {
  second,
  minute,
  hour,
  day,
  week,
  month,
  year,
  unknown,
}

class BlogPostDuration extends Equatable {
  final int duration;
  final BlogPostDurationUnit unit;

  const BlogPostDuration({
    required this.duration,
    required this.unit,
  });

  @override
  List<Object> get props => [duration, unit];
}