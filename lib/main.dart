import 'package:flutter/material.dart';

import 'views/dev_view.dart';
import 'views/chat.dart';
import 'views/chats_overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const DevView(),
        '/chat': (context) => const ChatView(),
        '/chatsOverview':(context) => const ChatsOverview(),
      },
    );
  }
}
