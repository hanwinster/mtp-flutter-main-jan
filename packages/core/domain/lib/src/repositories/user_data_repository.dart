import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class UserDataRepository {
  Stream<Language?> observeLanguage();

  Future<Language?> getLanguage();

  Future<void> saveLanguage(Language language);

  Stream<Result<User?>> observeLoggedInUser();
}
