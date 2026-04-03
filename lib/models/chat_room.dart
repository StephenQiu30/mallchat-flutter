class ChatRoom {
  final String id;
  final String name;
  final String avatar;
  final String topMessage;
  final String time;
  final int unreadCount;
  final bool isAi;
  final bool isGroup;

  ChatRoom({
    required this.id,
    required this.name,
    required this.avatar,
    required this.topMessage,
    required this.time,
    this.unreadCount = 0,
    this.isAi = false,
    this.isGroup = false,
  });
}
