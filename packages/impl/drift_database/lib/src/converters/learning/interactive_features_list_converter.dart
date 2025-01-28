import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class InteractiveFeaturesListConverter extends TypeConverter<List<InteractiveFeatureEntity>, String> {
  const InteractiveFeaturesListConverter();

  @override
  List<InteractiveFeatureEntity> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => InteractiveFeatureEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<InteractiveFeatureEntity> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
