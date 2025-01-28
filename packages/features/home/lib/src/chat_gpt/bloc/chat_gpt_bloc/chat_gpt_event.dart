
import 'package:base/base.dart';

abstract class ChatGPTEvent extends Equatable {
  const ChatGPTEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatGPTEvent {
  final String message;

  const SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}
