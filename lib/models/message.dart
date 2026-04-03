enum MessageType { text, image, voice, aiContext }

class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String senderAvatar;
  final String content;
  final MessageType type;
  final bool isSelf;
  final DateTime createTime;

  Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderAvatar,
    required this.content,
    this.type = MessageType.text,
    required this.isSelf,
    required this.createTime,
  });
}
