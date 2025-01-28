import 'dart:convert';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_gpt_event.dart';
import 'chat_gpt_state.dart';

class ChatGPTBloc extends Bloc<ChatGPTEvent, ChatGPTState> {
  final GetChatGptUseCase _chatGptUseCase;
  ChatGPTBloc({
    GetChatGptUseCase? getChatGPTUseCase,
  }) : _chatGptUseCase = getChatGPTUseCase ?? getIt(), super(ChatInitialState()) {
    List<Map<String,String>> messages = [];

    on<SendMessageEvent>((event, emit) async {
      int timeStamp = DateTime.now().millisecondsSinceEpoch;
      messages.add({'message': event.message, 'sender': 'user'});
      messages.add({'message': 'Loading...', 'sender': 'bot'});
      emit(ChatLoadedState(messages: messages, timeStamp: timeStamp));
      try {
        final response = await _chatGptUseCase(event.message);
        var jsonData = jsonDecode(response);
        messages.removeAt(messages.length - 1);
        messages.add({'message': jsonData['bot'], 'sender': 'bot'});
        emit(ChatBotLoadedState(messages: messages, timeStamp: timeStamp));
      } catch (e) {
        emit(ChatErrorState(e.toString()));
      }
    });
  }
}
