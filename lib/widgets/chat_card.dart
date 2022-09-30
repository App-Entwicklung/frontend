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
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chat.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )))
        ],
      ),
    );
