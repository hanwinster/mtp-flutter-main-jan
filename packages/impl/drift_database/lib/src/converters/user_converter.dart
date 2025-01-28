import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class UserConverter extends TypeConverter<UserEntity, String> {
  const UserConverter();

  @override
  UserEntity fromSql(String fromDb) {
    return UserEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(UserEntity value) {
    return jsonEncode(value.toJson());
  }
}
