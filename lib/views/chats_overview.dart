import 'package:flutter/material.dart';

class ChatsOverview extends StatelessWidget {
  const ChatsOverview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {}, )],
      ),
      body: Text('Rebekkas ToDo'),
    );
  }
}
