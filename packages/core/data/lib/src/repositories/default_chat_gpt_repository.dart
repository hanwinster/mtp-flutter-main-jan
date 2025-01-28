import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultChatGPTRepository extends ChatGPTRepository {
  DefaultChatGPTRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<String> getChatGPTMessages({
    required String prompt,
  }) {
    return _api.getChatGPTMessages(prompt: prompt);
  }
}
