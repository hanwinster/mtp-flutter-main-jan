import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

import '../hive_ids.dart';

part 'college_preference.g.dart';

@HiveType(typeId: HiveTypeId.collegePreference)
class CollegePreference {
  const CollegePreference({
    required this.id,
    required this.name,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  factory CollegePreference.fromDomainModel(College college) {
    return CollegePreference(
      id: college.id,
      name: college.name,
    );
  }

  static CollegePreference? fromDomainModelOrNull(College? college) {
    if (college == null) {
      return null;
    }
    return CollegePreference.fromDomainModel(college);
  }

  College toDomainModel() {
    return College(
      id: id,
      name: name,
    );
  }
}
