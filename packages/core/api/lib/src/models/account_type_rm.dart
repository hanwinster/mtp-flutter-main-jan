import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_type_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum AccountTypeRM {
  @JsonValue('1')
  teacher,
  @JsonValue('2')
  learner,
  @JsonValue('-1')
  unknown;

  factory AccountTypeRM.fromJson(String value) => decodeEnum(
        _$AccountTypeRMEnumMap,
        value,
        unknownValue: AccountTypeRM.unknown,
      );

  String toJson() => encodeEnum(_$AccountTypeRMEnumMap, this);

  factory AccountTypeRM.fromDomainModel(AccountType domainModel) {
    switch (domainModel) {
      case AccountType.teacher:
        return AccountTypeRM.teacher;
      case AccountType.learner:
        return AccountTypeRM.learner;
      default:
        return AccountTypeRM.unknown;
    }
  }
}