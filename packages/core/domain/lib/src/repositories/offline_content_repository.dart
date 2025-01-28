import 'package:domain/domain.dart';

abstract class OfflineContentRepository {
  Future<OfflineContentModel> getOfflineContent();
}