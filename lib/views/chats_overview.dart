import 'package:flutter/material.dart';
import 'package:frontend/example/chat_example.dart';
import 'package:frontend/views/chat.dart';
import 'package:frontend/widgets/bottom_menu.dart';
import 'package:frontend/widgets/chat_card.dart';

class ChatsOverview extends StatelessWidget {
  const ChatsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
          itemBuilder: (context, index) => chatCard(
              chatsData[index],
              (() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatView()))))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_1),
      ),
      bottomNavigationBar: const BottomMenu(index: 0),
    );
  }
}
