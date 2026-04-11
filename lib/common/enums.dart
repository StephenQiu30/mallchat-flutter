/// 聊天房间类型
enum RoomType {
  group(1, '群聊'),
  private(2, '私聊');

  final int value;
  final String label;
  const RoomType(this.value, this.label);

  static RoomType fromValue(int? value) {
    return RoomType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => RoomType.private,
    );
  }
}

/// 消息类型
enum MessageType {
  text(1, '文本'),
  image(2, '图片'),
  file(3, '文件'),
  emotion(4, '表情'),
  video(5, '视频'),
  voice(6, '语音');

  final int value;
  final String label;
  const MessageType(this.value, this.label);

  static MessageType fromValue(int? value) {
    return MessageType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => MessageType.text,
    );
  }
}

/// 消息状态
enum MessageStatus {
  normal(0, '正常'),
  recalled(1, '已撤回'),
  deleted(2, '已删除');

  final int value;
  final String label;
  const MessageStatus(this.value, this.label);

  static MessageStatus fromValue(int? value) {
    return MessageStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => MessageStatus.normal,
    );
  }
}

/// 用户在线状态
enum ActiveStatus {
  online(1, '在线'),
  offline(2, '离线');

  final int value;
  final String label;
  const ActiveStatus(this.value, this.label);

  static ActiveStatus fromValue(int? value) {
    return ActiveStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ActiveStatus.offline,
    );
  }
}
