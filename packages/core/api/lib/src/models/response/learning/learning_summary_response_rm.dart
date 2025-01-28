import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_summary_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class LearningSummaryResponseRM extends Equatable {
  @JsonKey(name: 'summary')
  final LearningSummaryRM? summary;
  @JsonKey(name: 'summary_media')
  final List<MediaRM>? mediaList;

  const LearningSummaryResponseRM({
    this.summary,
    this.mediaList,
  });

  @override
  List<Object?> get props => [
        summary,
        mediaList,
      ];

  factory LearningSummaryResponseRM.fromJson(Map<String, dynamic> json) =>
      _$LearningSummaryResponseRMFromJson(json);

  LearningSummaryRM toLearningSummaryRM() {
    return summary?.copyWith(
          mediaList: mediaList,
        ) ??
        (throw Exception('summary must not be null'));
  }
}
