import 'package:flutter/material.dart';

Widget chatMessage(String content, EdgeInsetsGeometry edgeInsetsGeometry) {
  return Padding(
    padding: edgeInsetsGeometry,
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.green,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 3),
            spreadRadius: 0.5,
            blurRadius: 1,
          ),
        ],
      ),
      width: 15,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          content,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    ),
  );
}
