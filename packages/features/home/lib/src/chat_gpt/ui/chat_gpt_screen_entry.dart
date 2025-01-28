import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/chat_gpt/bloc/chat_gpt_bloc/chat_gpt_bloc.dart';
import 'package:home/src/chat_gpt/ui/chat_gpt_screen.dart';


class ChatGptScreenEntry extends StatelessWidget {
  const ChatGptScreenEntry({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatGPTBloc(),
      child: ChatGPTScreen(),
    );
  }
}
