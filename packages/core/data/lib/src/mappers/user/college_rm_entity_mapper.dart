import 'package:api/api.dart';
import 'package:database/database.dart';

extension CollegeRMEntityMapper on CollegeRM {
  CollegeEntity toEntity() {
    return CollegeEntity(
      id: id?.toString() ?? (throw Exception('College id is null')),
      name: name ?? '',
    );
  }
}
