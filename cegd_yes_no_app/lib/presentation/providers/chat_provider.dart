import 'package:flutter/material.dart';
import 'package:cegd_yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola', fromWho: FromWho.mine),
    Message(text: 'Mundo', fromWho: FromWho.her),
  ];

  Future<void> sendMessage(String text) async {}
}
