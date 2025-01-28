import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetUserManualsUseCase {
  GetUserManualsUseCase({
    UserManualRepository? repository,
  }) : _repository = repository ?? getIt();

  final UserManualRepository _repository;

  Future<List<UserManual>> call() {
    return _repository.getUserManuals();
  }
}
