import 'package:flutter/material.dart';
import 'package:frontend/helpers/datetime_formatter.dart';
import 'package:frontend/helpers/message.dart';

Widget chatMessage(MyMessage message, Alignment alignment, double maxWidth) {
  var date = "";
  const messageStyle = TextStyle(fontSize: 25);
  final dateStyle = TextStyle(color: Colors.grey.shade800, fontSize: 15);
  try {
    date = DateTimeFormatter.DDMMYYYY_hhmmss(DateTime.parse(message.timestamp));
  } catch (e) {
    e.toString();
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  var dateWidth = _textSize(date, dateStyle).width + 15;
  var messageWidth = _textSize(message.content, messageStyle).width + 25;

  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
      alignment: alignment,
      child: SizedBox(
        width: dateWidth < messageWidth ? messageWidth : dateWidth,
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
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    message.content,
                    style: messageStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    date,
                    style: dateStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
