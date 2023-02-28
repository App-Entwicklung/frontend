import 'package:flutter/material.dart';
import 'package:frontend/helpers/contract.dart';
import 'package:frontend/views/web3home.dart';

import 'views/dev_view.dart';
import 'views/chat.dart';
import 'views/chats_overview.dart';

void main() {
  runApp(const Web3Home());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Contract.initEthClient();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const DevView(),
        '/chat': (context) => const ChatView(),
        '/chatsOverview': (context) => const ChatsOverview()
      },
    );
  }
}
