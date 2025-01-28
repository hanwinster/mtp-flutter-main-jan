// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_summary_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningSummaryResponseRM _$LearningSummaryResponseRMFromJson(
        Map<String, dynamic> json) =>
    LearningSummaryResponseRM(
      summary: json['summary'] == null
          ? null
          : LearningSummaryRM.fromJson(json['summary'] as Map<String, dynamic>),
      mediaList: (json['summary_media'] as List<dynamic>?)
          ?.map((e) => MediaRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
