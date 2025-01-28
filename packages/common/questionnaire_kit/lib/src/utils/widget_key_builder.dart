import 'package:flutter/foundation.dart';

class WidgetKeyBuilder {
  const WidgetKeyBuilder._();

  static Key buildGenericKey(String identifier) {
    return ValueKey(identifier);
  }

  static Key buildKey(String questionId, [String identifier = '']) {
    return ValueKey('$questionId-$identifier');
  }

  static Key buildCompositeKey(String questionId, List<dynamic> identifiers) {
    final combined = [questionId, ...identifiers].join('-');
    return ValueKey(combined);
  }
}