import 'package:flutter/material.dart';
import 'package:frontend/example/Chat_Example.dart';
import 'package:frontend/widgets/chat_card.dart';

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
      body: ListView.builder(
        itemCount: chatsData.length,
        itemBuilder: (context, index) => chatCard(chatsData[index], (() {})),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
