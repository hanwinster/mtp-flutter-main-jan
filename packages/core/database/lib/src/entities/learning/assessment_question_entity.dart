import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class AssessmentQuestionEntity extends Equatable {
  const AssessmentQuestionEntity({
    required this.id,
    required this.courseId,
    required this.question,
    required this.options,
    required this.correctAnswers,
    required this.passingOption,
    required this.order,
    required this.type,
    required this.userAnswer,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final String id;
  final String courseId;
  final String question;
  final List<String> options;
  final List<String> correctAnswers;
  final AssessmentQuestionPassingOptionEntity passingOption;
  final int order;
  final AssessmentQuestionTypeEntity type;
  final AssessmentUserAnswerEntity? userAnswer;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  @override
  List<Object?> get props => [
        id,
        courseId,
        question,
        options,
        correctAnswers,
        passingOption,
        order,
        type,
        userAnswer,
        createdAt,
        updatedAt,
        deletedAt,
      ];



  AssessmentQuestion toDomainModel() {
    return AssessmentQuestion(
      id: id,
      question: question,
      options: options,
      correctAnswers: correctAnswers,
      passingOption: passingOption.toDomainModel(),
      order: order,
      type: type.toDomainModel(),
      userAnswer: userAnswer?.toDomainModel(),
    );
  }

  AssessmentQuestionEntity copyWith({
    String? id,
    String? courseId,
    String? question,
    List<String>? options,
    List<String>? correctAnswers,
    AssessmentQuestionPassingOptionEntity? passingOption,
    int? order,
    AssessmentQuestionTypeEntity? type,
    AssessmentUserAnswerEntity? userAnswer,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return AssessmentQuestionEntity(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      passingOption: passingOption ?? this.passingOption,
      order: order ?? this.order,
      type: type ?? this.type,
      userAnswer: userAnswer ?? this.userAnswer,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
