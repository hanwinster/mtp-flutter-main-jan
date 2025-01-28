import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gender_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum GenderEntity {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue('others')
  other,
  @JsonValue('unknown')
  unknown;

  factory GenderEntity.fromJson(String value) => decodeEnum(
        _$GenderEntityEnumMap,
        value,
        unknownValue: GenderEntity.unknown,
      );

  String toJson() => encodeEnum(_$GenderEntityEnumMap, this);

  Gender toDomainModel() {
    switch (this) {
      case GenderEntity.male:
        return Gender.male;
      case GenderEntity.female:
        return Gender.female;
      case GenderEntity.other:
        return Gender.other;
      case GenderEntity.unknown:
        return Gender.unknown;
    }
  }
}
