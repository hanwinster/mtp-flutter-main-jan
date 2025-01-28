import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveLoggedInUserUseCase {
  final UserDataRepository _userDataRepository;

  ObserveLoggedInUserUseCase({UserDataRepository? userDataRepository})
      : _userDataRepository = userDataRepository ?? getIt();

  Stream<Result<User?>> call() {
    return _userDataRepository.observeLoggedInUser();
  }
}
