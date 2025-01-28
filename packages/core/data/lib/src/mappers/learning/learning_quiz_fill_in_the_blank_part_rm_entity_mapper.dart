import 'package:api/api.dart';
import 'package:database/database.dart';


extension LearningQuizFillInTheBlankPartRMEntityMapper
    on LearningQuizFillInTheBlankPartRM {
  LearningQuizFillInTheBlankPartEntity toEntity() {
    return LearningQuizFillInTheBlankPartEntity(
      sentence: sentence ?? '',
      blank: blank ?? '',
    );
  }
}
