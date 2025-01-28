
import 'package:database/database.dart';
import 'package:drift/drift.dart';

class ReactionTypeConverter extends TypeConverter<ReactionTypeEntity, String> {
  const ReactionTypeConverter();

  @override
  ReactionTypeEntity fromSql(String fromDb) {
    return ReactionTypeEntity.fromJson(fromDb);
  }

  @override
  String toSql(ReactionTypeEntity value) {
    return value.toJson();
  }
}
