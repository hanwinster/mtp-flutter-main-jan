import 'package:base/base.dart';
import 'package:domain/domain.dart';

class LearningQuizAssignmentUserAnswer extends Equatable {
  final String id;
  final String attachedFileUrl;
  final int score;
  final String comment;
  final User? commentBy;

  const LearningQuizAssignmentUserAnswer({
    required this.id,
    required this.attachedFileUrl,
    required this.score,
    required this.comment,
    this.commentBy,
  });

  @override
  List<Object?> get props => [id, attachedFileUrl, score, comment, commentBy,];
}


