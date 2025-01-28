import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

import '../hive_ids.dart';

part 'education_year_preference.g.dart';

@HiveType(typeId: HiveTypeId.educationYearPreference)
class EducationYearPreference extends Equatable {
  const EducationYearPreference({
    required this.id,
    required this.title,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;

  static EducationYearPreference fromDomainModel(EducationYear domainModel) {
    return EducationYearPreference(
      id: domainModel.id,
      title: domainModel.title,
    );
  }

  EducationYear toDomainModel() {
    return EducationYear(
      id: id,
      title: title,
    );
  }

  @override
  List<Object> get props => [id, title];
}
