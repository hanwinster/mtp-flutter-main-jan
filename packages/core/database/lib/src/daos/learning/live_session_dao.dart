import 'package:database/database.dart';

abstract class LiveSessionDao {
  Future<void> upsertEntity({
    required LiveSessionEntity entity,
  });

  Stream<LiveSessionEntity?> observeEntity({
    required String id,
  });
}
