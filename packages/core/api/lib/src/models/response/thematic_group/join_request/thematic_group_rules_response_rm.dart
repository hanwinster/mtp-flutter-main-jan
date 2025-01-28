import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_rules_response_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupRulesResponseRM {
  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'data')
  final ThematicGroupData? data;

  ThematicGroupRulesResponseRM({
    this.status,
    this.data,
  });

  factory ThematicGroupRulesResponseRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupRulesResponseRMFromJson(json);

  ThematicGroupRulesResponse toDomainModel() {
    return ThematicGroupRulesResponse(
        status: status ?? 0,
        details: data?.toDomainModel() ?? (throw Exception('data is null')),
    );
  }
}

@JsonSerializable(createToJson: false)
class ThematicGroupData {
  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'b-rules')
  final String? bRules;

  @JsonKey(name: 'rules')
  final List<RuleSection>? rules;

  ThematicGroupData({
    this.title,
     this.description,
     this.bRules,
    this.rules,
  });

  factory ThematicGroupData.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupDataFromJson(json);

  ThematicGroupDetails toDomainModel() {
    return ThematicGroupDetails(
      title: title ?? '',
      description: description ?? '',
      behaviorRules: bRules ?? '',
      rules: rules?.map((rule) => rule.toDomainModel()).toList() ?? [],
    );
  }
}

@JsonSerializable(createToJson: false)
class RuleSection {
  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'rule')
  final String? rule;

  @JsonKey(name: 'rules')
  final List<RuleItem>? rules;

  RuleSection({
    this.title,
    this.rule,
    this.rules,
  });

  factory RuleSection.fromJson(Map<String, dynamic> json) =>
      _$RuleSectionFromJson(json);

  ThematicRuleSection toDomainModel() {
    return ThematicRuleSection(
      title: title ?? '',
      rule: rule ?? '',
      ruleItems: rules?.map((item) => item.toDomainModel()).toList() ?? [],
    );
  }
}

@JsonSerializable(createToJson: false)
class RuleItem {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'description')
  final String? description;

  RuleItem({
    this.id,
    this.description,
  });

  factory RuleItem.fromJson(Map<String, dynamic> json) =>
      _$RuleItemFromJson(json);

  ThematicRuleItem toDomainModel() {
    return ThematicRuleItem(
      id: id ?? '',
      description: description ?? '',
    );
  }
}
