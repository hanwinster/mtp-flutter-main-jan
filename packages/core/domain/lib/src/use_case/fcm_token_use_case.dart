import 'package:base/base.dart';
import 'package:domain/domain.dart';

class FcmTokenUseCase {
  FcmTokenUseCase({
    FcmTokenRepository? fcmTokenRepository
  }) : _fcmTokenRepository = fcmTokenRepository ?? getIt();

  final FcmTokenRepository _fcmTokenRepository;

  Future<FcmTokenUpdateResponse> call(String token) async {
    return await _fcmTokenRepository.setFcmToken(token: token ??'');
  }
}
