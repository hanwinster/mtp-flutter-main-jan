import 'package:api/api.dart';
import 'package:database/database.dart';

extension InteractiveSortingAnswerOptionRMEntityMapper
    on InteractiveSortingAnswerOptionRM {
  InteractiveSortingAnswerOptionEntity toEntity() {
    return InteractiveSortingAnswerOptionEntity(
      key: key ?? -1,
      answer: answer ?? '',
    );
  }
}
