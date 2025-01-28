import 'package:base/base.dart';

abstract class ChatGPTState extends Equatable {
  const ChatGPTState();

  @override
  List<Object> get props => [];
}

class ChatInitialState extends ChatGPTState {}

class ChatLoadedState extends ChatGPTState {
  final List<Map<String, String>> messages;
  final int timeStamp;

  const ChatLoadedState({required this.messages, required this.timeStamp});

  @override
  List<Object> get props => [messages, timeStamp];
}

class ChatBotLoadedState extends ChatGPTState {
  final List<Map<String, String>> messages;
  final int timeStamp;

  const ChatBotLoadedState({required this.messages, required this.timeStamp});

  @override
  List<Object> get props => [messages, timeStamp];
}

class ChatErrorState extends ChatGPTState {
  final String message;

  const ChatErrorState(this.message);

  @override
  List<Object> get props => [message];
}
