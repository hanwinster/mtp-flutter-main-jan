import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/chat_gpt/bloc/chat_gpt_bloc/chat_gpt_bloc.dart';
import 'package:home/src/chat_gpt/bloc/chat_gpt_bloc/chat_gpt_event.dart';
import 'package:home/src/chat_gpt/bloc/chat_gpt_bloc/chat_gpt_state.dart';
import 'package:ui/ui.dart';

class ChatGPTScreen extends StatelessWidget {
  ChatGPTScreen({super.key});

  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChatGPT via GPT-4',
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: Grid.two,
          left: Grid.two,
          right: Grid.two,
        ),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatGPTBloc, ChatGPTState>(
                builder: (context, state) {
                  if (state is ChatLoadedState) {
                    return ListView.builder(
                      reverse: true, // Show latest messages at the bottom
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        var msg =
                            state.messages[state.messages.length - 1 - index];
                        bool isUser = msg['sender'] == 'user';
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? Colors.blue[100]
                                    : Colors.grey[200],
                                borderRadius: isUser
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )
                                    : const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                              ),
                              child: Text(msg['message']!),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is ChatBotLoadedState) {
                    return ListView.builder(
                      reverse: true, // Show latest messages at the bottom
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        var msg =
                            state.messages[state.messages.length - 1 - index];
                        bool isUser = msg['sender'] == 'user';
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? MtpColors.primaryColor
                                    : MtpColors.timerSliderBGColor,
                                borderRadius: isUser
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )
                                    : const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                              ),
                              child: Text(
                                msg['message']!,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: isUser
                                      ? MtpColors.white
                                      : MtpColors.textBlack,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MtpAssets.icons.robot.svg(
                            width: 45,
                            height: 45,
                            colorFilter: const ColorFilter.mode(
                              MtpColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(
                            height: Grid.two,
                          ),
                          Text(
                            '${context.l10n.chatGPTWelcomeTo} \n ${context.l10n.chatGPTMTPAIBot}',
                            style: context.textTheme.headlineLarge,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Grid.one),
              decoration: BoxDecoration(
                border: Border.all(color: MtpColors.grey),
                borderRadius: BorderRadius.circular(BorderRadiusSize.normal),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: context.l10n.chatGPTTypeMessage,
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        context
                            .read<ChatGPTBloc>()
                            .add(SendMessageEvent(textController.text));
                        textController.clear();
                        focusNode.unfocus();
                      }
                    },
                  )
                  // Expanded(
                  //   child: TextField(
                  //     controller: textController,
                  //     decoration: const InputDecoration(
                  //       hintText: 'Type your message...',
                  //       border: OutlineInputBorder(),
                  //     ),
                  //   ),
                  // ),
                  // IconButton(
                  //   icon: const Icon(Icons.send),
                  //   onPressed: () {
                  //     if (textController.text.isNotEmpty) {
                  //       context
                  //           .read<ChatGPTBloc>()
                  //           .add(SendMessageEvent(textController.text));
                  //       // startLoadingAnimation();
                  //       textController.clear();
                  //     }
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
