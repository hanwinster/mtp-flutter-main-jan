class ThematicGroupRulesResponse {
  final int status;
  final ThematicGroupDetails details;

  ThematicGroupRulesResponse({
    required this.status,
    required this.details,
  });
}

class ThematicGroupDetails {
  final String title;
  final String description;
  final String behaviorRules;
  final List<ThematicRuleSection> rules;

  ThematicGroupDetails({
    required this.title,
    required this.description,
    required this.behaviorRules,
    required this.rules,
  });
}

class ThematicRuleSection {
  final String title;
  final String rule;
  final List<ThematicRuleItem> ruleItems;

  ThematicRuleSection({
    required this.title,
    required this.rule,
    required this.ruleItems,
  });
}

class ThematicRuleItem {
  final String id;
  final String description;

  ThematicRuleItem({
    required this.id,
    required this.description,
  });
}
