import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SaveLanguageUseCase {
  final UserDataRepository _userDataRepository;

  SaveLanguageUseCase({
    UserDataRepository? userDataRepository,
  }) : _userDataRepository = userDataRepository ?? getIt();

  Future<void> call(Language language) async {
    await _userDataRepository.saveLanguage(language);
  }
}