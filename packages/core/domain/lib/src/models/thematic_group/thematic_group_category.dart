class ThematicGroupCategory {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int numberOfGroups;

  ThematicGroupCategory({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.numberOfGroups,
  });
}