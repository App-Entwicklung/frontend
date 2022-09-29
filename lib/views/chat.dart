import 'package:flutter/material.dart';
import 'package:frontend/helpers/message.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  var messages = []; //TODO: Fill onInit
  var myUserID = ""; //TODO: As input param
  var contactUserID = ""; //TODO: As input param
  var messageContent = "";

  sendMessage() {
    if (messageContent == "") {
      return;
    }
    MyMessage.fromValues(myUserID, contactUserID,
        DateTime.now().toIso8601String(), messageContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: Column(
          children: [
            Expanded(
              flex: 25,
              child: Container(
                color: Colors.black,
              ),
            ),
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
