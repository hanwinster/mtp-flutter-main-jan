import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'x_api_completion_status_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum XApiCompletionStatusRM {
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('INCOMPLETE')
  incomplete,
  @JsonValue('unknown')
  unknown;

  factory XApiCompletionStatusRM.fromJson(String value) => decodeEnum(
        _$XApiCompletionStatusRMEnumMap,
        value,
        unknownValue: XApiCompletionStatusRM.unknown,
      );

  String toJson() => encodeEnum(_$XApiCompletionStatusRMEnumMap, this);

  XApiCompletionStatus toDomainModel() {
    switch (this) {
      case XApiCompletionStatusRM.completed:
        return XApiCompletionStatus.completed;
      case XApiCompletionStatusRM.incomplete:
        return XApiCompletionStatus.incomplete;
      default:
        return XApiCompletionStatus.unknown;
    }
  }
}
