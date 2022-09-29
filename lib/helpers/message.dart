import 'dart:convert';

class Message {
  final String sender;
  final String receiver;
  final String timestamp;
  final String content;

  Message._(this.sender, this.receiver, this.timestamp, this.content);

  static Message fromJson(String jsonString) {
    Map<String, String> message = json.decode(jsonString);
    return Message._(message['sender']!, message['receiver']!,
        message['timeStamp']!, message['content']!);
  }

  String toJsonString() {
    return '''
    {
      "sender": $sender,
      "receiver": $receiver,
      "timestamp": $timestamp,
      "content": $content
    }
    ''';
  }
}
