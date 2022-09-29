import 'dart:convert';

class Message {
  final String sender;
  final String receiver;
  final String timeStamp;
  final String content;

  Message._(this.sender, this.receiver, this.timeStamp, this.content);

  static Message fromJson(String jsonString) {
    Map<String, String> message = json.decode(jsonString);
    return Message._(message['sender']!, message['receiver']!,
        message['timeStamp']!, message['content']!);
  }
}
