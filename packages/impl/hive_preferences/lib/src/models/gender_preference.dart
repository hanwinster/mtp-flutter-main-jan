import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import '../hive_ids.dart';

part 'gender_preference.g.dart';

@HiveType(typeId: HiveTypeId.genderPreference)
enum GenderPreference {
  @HiveField(0)
  male,
  @HiveField(1)
  female,
  @HiveField(2)
  other,
  @HiveField(3)
  unknown;

  factory GenderPreference.fromDomainModel(Gender domainModel) {
    switch (domainModel) {
      case Gender.male:
        return GenderPreference.male;
      case Gender.female:
        return GenderPreference.female;
      case Gender.other:
        return GenderPreference.other;
      default:
        return GenderPreference.unknown;
    }
  }

  Gender toDomainModel() {
    switch (this) {
      case GenderPreference.male:
        return Gender.male;
      case GenderPreference.female:
        return Gender.female;
      case GenderPreference.other:
        return Gender.other;
      default:
        return Gender.unknown;
    }
  }
}
