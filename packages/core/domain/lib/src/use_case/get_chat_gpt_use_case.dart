import 'package:base/base.dart';
import 'package:domain/src/repositories/chat_gpt_repository.dart';

class GetChatGptUseCase {
  final ChatGPTRepository _chatGPTRepository;

  GetChatGptUseCase({ChatGPTRepository? chatGPTRepository})
      : _chatGPTRepository = chatGPTRepository ?? getIt();

  Future<String> call(String prompt) {
    return _chatGPTRepository.getChatGPTMessages(prompt: prompt);
  }
}
