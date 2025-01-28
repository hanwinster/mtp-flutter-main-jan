import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CourseReview extends Equatable {
  final String id;
  final User? user;
  final double rating;
  final String remark;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const CourseReview({
    required this.id,
    required this.user,
    required this.rating,
    required this.remark,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        user,
        rating,
        remark,
        createdAt,
        updatedAt,
      ];
}
