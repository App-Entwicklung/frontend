import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  var messages = [];

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
                    const Expanded(
                      flex: 10,
                      child: TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
