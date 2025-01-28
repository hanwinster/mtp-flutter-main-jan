import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gender_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum GenderRM {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue('others')
  other,
  @JsonValue('unknown')
  unknown;

  factory GenderRM.fromJson(String value) => decodeEnum(
        _$GenderRMEnumMap,
        value,
        unknownValue: GenderRM.unknown,
      );

  String toJson() => encodeEnum(_$GenderRMEnumMap, this);

  Gender toDomainModel() {
    switch (this) {
      case GenderRM.male:
        return Gender.male;
      case GenderRM.female:
        return Gender.female;
      case GenderRM.other:
        return Gender.other;
      case GenderRM.unknown:
        return Gender.unknown;
    }
  }

  factory GenderRM.fromDomainModel(Gender gender) {
    switch (gender) {
      case Gender.male:
        return GenderRM.male;
      case Gender.female:
        return GenderRM.female;
      case Gender.other:
        return GenderRM.other;
      case Gender.unknown:
        return GenderRM.unknown;
    }
  }
}
