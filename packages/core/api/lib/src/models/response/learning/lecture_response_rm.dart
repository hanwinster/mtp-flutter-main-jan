import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecture_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class LectureResponseRM extends Equatable {
  @JsonKey(name: 'lecture')
  final LectureRM? lecture;
  @JsonKey(name: 'lecture_media')
  final List<MediaRM>? mediaList;
  @JsonKey(name: 'lecture_quizzes')
  final List<LearningQuizRM>? quizzes;

  const LectureResponseRM({
    this.lecture,
    this.quizzes,
    this.mediaList,
  });

  @override
  List<Object?> get props =>
      [
        lecture,
        quizzes,
        mediaList,
      ];

  factory LectureResponseRM.fromJson(Map<String, dynamic> json) =>
      _$LectureResponseRMFromJson(json);

  LectureRM toLectureRM() {
    return lecture?.copyWith(
      quizzes: quizzes,
    ) ??
        (throw Exception('Lecture must not be null'));
  }
}