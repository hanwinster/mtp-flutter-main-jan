import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveUserLanguageUseCase {
  ObserveUserLanguageUseCase({
    UserDataRepository? userDataRepository,
  }) : _userDataRepository = userDataRepository ?? getIt();
  final UserDataRepository _userDataRepository;

  Stream<Language?> call() {
    return _userDataRepository.observeLanguage();
  }
}
