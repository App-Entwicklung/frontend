import 'package:flutter/material.dart';

import '../example/Chat_Example.dart';

Widget chatCard(Chat chat) => Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(chat.image),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
    );
