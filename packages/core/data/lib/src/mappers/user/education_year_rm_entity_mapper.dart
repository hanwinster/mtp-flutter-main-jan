import 'package:api/api.dart';
import 'package:database/database.dart';

extension EducationYearRMEntityMapper on EducationYearRM {
  EducationYearEntity toEntity() {
    return EducationYearEntity(
      id: id?.toString() ?? (throw Exception('id is null')),
      title: title ?? '',
    );
  }
}
