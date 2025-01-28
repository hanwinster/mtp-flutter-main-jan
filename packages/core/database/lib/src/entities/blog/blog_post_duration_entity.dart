import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class BlogPostDurationEntity extends Equatable {
  final int duration;
  final BlogPostDurationUnitEntity unit;

  const BlogPostDurationEntity({
    required this.duration,
    required this.unit,
  });

  @override
  List<Object> get props => [duration, unit];

  BlogPostDuration toDomainModel() {
    return BlogPostDuration(
      duration: duration,
      unit: unit.toDomainModel(),
    );
  }
}
