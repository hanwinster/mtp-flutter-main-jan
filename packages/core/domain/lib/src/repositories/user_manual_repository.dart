import 'package:domain/domain.dart';

abstract class UserManualRepository {
  Future<List<UserManual>> getUserManuals();
}