import 'package:database/database.dart';

abstract class LearningSummaryDao {
  Future<void> upsertEntity({
    required LearningSummaryEntity entity,
  });

  Stream<LearningSummaryEntity?> observeEntity({
    required String id,
  });
}
