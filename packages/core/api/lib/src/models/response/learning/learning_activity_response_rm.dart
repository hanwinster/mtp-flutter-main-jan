import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_activity_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class LearningActivityResponseRM extends Equatable {
  @JsonKey(name: 'learning_activity')
  final LearningActivityRM? learningActivity;
  @JsonKey(name: 'learning_activity_media')
  final List<MediaRM>? mediaList;

  const LearningActivityResponseRM({
    this.learningActivity,
    this.mediaList,
  });

  @override
  List<Object?> get props => [
        learningActivity,
        mediaList,
      ];

  factory LearningActivityResponseRM.fromJson(Map<String, dynamic> json) =>
      _$LearningActivityResponseRMFromJson(json);

  LearningActivityRM toLearningActivityRM() {
    return learningActivity?.copyWith(
          mediaList: mediaList,
        ) ??
        (throw Exception('learning activity must not be null'));
  }
}
