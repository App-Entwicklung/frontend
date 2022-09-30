import 'package:flutter/material.dart';
import 'package:frontend/example/Chat_Example.dart';

class ChatsOverview extends StatelessWidget {
  const ChatsOverview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => const Text("Test"))),
    );
  }
}
