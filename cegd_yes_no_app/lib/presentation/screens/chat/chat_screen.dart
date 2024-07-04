import 'package:cegd_yes_no_app/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cegd_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:cegd_yes_no_app/presentation/widgets/chat/HerMessage.dart';
import 'package:cegd_yes_no_app/presentation/widgets/chat/MyMessage.dart';
import 'package:cegd_yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.her)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
