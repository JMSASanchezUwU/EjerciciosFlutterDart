import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entitites/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_filed_box.dart';

import '../../widgets/chat/my_message_bubble.dart';

class ChatScreem extends StatelessWidget {
  const ChatScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static-resource.np.community.playstation.net/avatar_xl/WWS_E/E2099_xl.png'),
            ),
          ),
          title: const Text('Usuario'),
          centerTitle: false),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messagesList.length,
                  itemBuilder: (contex, index) {
                    final message = chatProvider.messagesList[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                  })),

          ///Caja de texto

          MessageFieldBox(
            onValue: chatProvider.sendMessage,
          ),
        ]),
      ),
    );
  }
}
