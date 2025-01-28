import 'package:domain/domain.dart';
import 'package:domain/src/models/noti/fcm_token_update_response.dart';

abstract class FcmTokenRepository{

  Future<FcmTokenUpdateResponse> setFcmToken({required String token});
}