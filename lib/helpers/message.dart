import 'dart:convert';

class MyMessage {
  final String sender;
  final String receiver;
  final String timestamp;
  final String content;

  MyMessage._(this.sender, this.receiver, this.timestamp, this.content);

  static MyMessage fromValues(
      String sender, String receiver, String timestamp, String content) {
    return MyMessage._(sender, receiver, timestamp, content);
  }

  static MyMessage fromJson(String jsonString) {
    Map<String, String> message = json.decode(jsonString);
    return MyMessage._(message['sender']!, message['receiver']!,
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
