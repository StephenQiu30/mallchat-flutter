import 'package:mallchat_flutter/api/chat/export.dart';

enum LocalMessageSendState { sending, sent, failed }

class ChatMessageItem {
  const ChatMessageItem({
    required this.message,
    this.clientId,
    this.isLocalEcho = false,
  });

  final ChatMessageVo message;
  final String? clientId;
  final bool isLocalEcho;

  ChatMessageItem copyWith({
    ChatMessageVo? message,
    String? clientId,
    bool? isLocalEcho,
  }) {
    return ChatMessageItem(
      message: message ?? this.message,
      clientId: clientId ?? this.clientId,
      isLocalEcho: isLocalEcho ?? this.isLocalEcho,
    );
  }
}
