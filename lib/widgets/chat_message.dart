import 'package:flutter/material.dart';
import 'package:frontend/helpers/datetime_formatter.dart';
import 'package:frontend/helpers/message.dart';

Widget chatMessage(MyMessage message, EdgeInsetsGeometry edgeInsetsGeometry) {
  var date = "";
  try {
    date = DateTimeFormatter.DDMMYYYY_hhmmss(DateTime.parse(message.timestamp));
  } catch (e) {
    e.toString();
  }

  return Padding(
    padding: edgeInsetsGeometry,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.green.withOpacity(0.7),
        boxShadow: const [
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
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                message.content,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  date,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
                ))
          ],
        ),
      ),
    ),
  );
}
