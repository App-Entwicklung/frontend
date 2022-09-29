import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/helpers/message.dart';
import 'package:frontend/widgets/chat_message.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  var messages = [
    {"sender": "2", "receiver": "1", "timestamp": "", "content": "HI"},
    {"sender": "1", "receiver": "2", "timestamp": "", "content": "HI"},
  ]; //TODO: Fill onInit
  var myUserID = "1"; //TODO: As input param
  var contactUserID = "2"; //TODO: As input param
  var messageContent = "";

  sendMessage() {
    if (messageContent == "" || messageContent.trim().isEmpty) {
      return;
    }
    setState(() {
      messages.add(MyMessage.fromValues(myUserID, contactUserID,
              DateTime.now().toIso8601String(), messageContent.trim())
          .toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: Column(
          children: [
            // Chat
            Expanded(
              flex: 25,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    MyMessage message =
                        MyMessage.fromJson(json.encode(messages[index]));
                    return chatMessage(
                        message,
                        message.sender == myUserID ?
                            Alignment.centerRight : Alignment.centerLeft,
                        MediaQuery.of(context).size.width);
                  },
                ),
              ),
            ),
            // TextInput
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextField(
                        onChanged: (value) {
                          messageContent = value;
                        },
                        onSubmitted: (value) {
                          messageContent = value;
                          sendMessage();
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        sendMessage();
                      },
                      icon: const Icon(Icons.send),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
