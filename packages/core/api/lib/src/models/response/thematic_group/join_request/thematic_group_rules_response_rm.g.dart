// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_rules_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupRulesResponseRM _$ThematicGroupRulesResponseRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupRulesResponseRM(
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ThematicGroupData.fromJson(json['data'] as Map<String, dynamic>),
    );

ThematicGroupData _$ThematicGroupDataFromJson(Map<String, dynamic> json) =>
    ThematicGroupData(
      title: json['title'] as String?,
      description: json['description'] as String?,
      bRules: json['b-rules'] as String?,
      rules: (json['rules'] as List<dynamic>?)
          ?.map((e) => RuleSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

RuleSection _$RuleSectionFromJson(Map<String, dynamic> json) => RuleSection(
      title: json['title'] as String?,
      rule: json['rule'] as String?,
      rules: (json['rules'] as List<dynamic>?)
          ?.map((e) => RuleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

RuleItem _$RuleItemFromJson(Map<String, dynamic> json) => RuleItem(
      id: json['id'] as String?,
      description: json['description'] as String?,
    );
