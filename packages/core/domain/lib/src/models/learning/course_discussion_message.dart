import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CourseDiscussionMessage extends Equatable {
  final String id;
  final User? user;
  final String message;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const CourseDiscussionMessage({
    required this.id,
    required this.user,
    required this.message,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, user, message, createdAt, updatedAt];
}