import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'x_api_course_rm.g.dart';

@JsonSerializable(createToJson: false)
class XApiCourseRM extends Equatable {
  @JsonKey(name: 'launch_link')
  final String? launchLink;
  @JsonKey(name: 'completion_status')
  final XApiCourseCompletionStatusResponse? completionStatus;
  const XApiCourseRM({
    this.launchLink,
    this.completionStatus,
  });

  @override
  List<Object?> get props => [launchLink, completionStatus];

  factory XApiCourseRM.fromJson(Map<String, dynamic> json) =>
      _$XApiCourseRMFromJson(json);

  XApiCourse toDomainModel() {
    return XApiCourse(
      launchLink: launchLink ?? '',
      completionStatus: completionStatus?.completionStatus?.toDomainModel() ??
          XApiCompletionStatus.unknown,
    );
  }
}

@JsonSerializable(createToJson: false)
class XApiCourseCompletionStatusResponse extends Equatable {
  @JsonKey(
    name: 'registrationCompletion',
    unknownEnumValue: XApiCompletionStatusRM.unknown,
  )
  final XApiCompletionStatusRM? completionStatus;

  const XApiCourseCompletionStatusResponse({
    this.completionStatus,
  });

  @override
  List<Object?> get props => [completionStatus];

  factory XApiCourseCompletionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$XApiCourseCompletionStatusResponseFromJson(json);
}
