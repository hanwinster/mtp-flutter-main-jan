
enum CourseMaterialType {
  xapi._(['xapipackage']),
  intro._(['intro']),
  lecture._(['lect']),
  learningActivity._(['learning', 'lla']),
  quiz._(['quiz', 'lq']),
  summary._(['summary', 'lsum']),
  assessment._(['assessment']),
  liveSession._(['live_session', 'session']),
  evaluation._([]),
  unknown._([]);

  final List<String> prefixes;
  const CourseMaterialType._(this.prefixes);

  static CourseMaterialType fromPrefix(String prefix) {
    for (final type in CourseMaterialType.values) {
      if (type.prefixes.contains(prefix)) {
        return type;
      }
    }
    return CourseMaterialType.unknown;
  }
}