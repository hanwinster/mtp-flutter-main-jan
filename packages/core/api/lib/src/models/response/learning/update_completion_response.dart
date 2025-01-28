import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_completion_response.g.dart';

@JsonSerializable(createToJson: false)
class UpdateCompletionResponse extends Equatable {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'redirect_to')
  final CourseMaterialRM? nextCourseMaterial;
  @JsonKey(name: 'data')
  final CourseLearnerRM? courseLearner;

  const UpdateCompletionResponse({
    this.message,
    this.nextCourseMaterial,
    this.courseLearner,
  });

  @override
  List<Object?> get props => [message, nextCourseMaterial, courseLearner];

  factory UpdateCompletionResponse.fromJson(Map<String, dynamic> json) => _$UpdateCompletionResponseFromJson(json);
}