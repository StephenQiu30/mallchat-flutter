import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/models/chat_message_item.dart';
import 'package:mallchat_flutter/styles/glass_theme.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/components/chat/input_toolbar.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Request.chat;

    return Scaffold(
      backgroundColor: GlassTheme.backgroundGray,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(
                  TDIcons.chevron_left,
                  color: Color(0xFF1F2937),
                ),
                onPressed: () => Get.back(),
              )
            : null,
        title: Obx(() {
          final roomName = chatController.activeSession?.name ?? '聊天详情';
          return Text(
            roomName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          );
        }),
        actions: [
          IconButton(
            icon: const Icon(TDIcons.more, color: GlassTheme.textDark),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final roomId = chatController.activeRoomId.value;
              final messages = chatController.activeMessages;

              if (roomId == null) {
                return const Center(
                  child: Text(
                    '请选择一个会话',
                    style: TextStyle(color: GlassTheme.textLightGray),
                  ),
                );
              }

              if (chatController.isHistoryLoading(roomId) && messages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (messages.isEmpty) {
                return const Center(
                  child: Text(
                    '暂无消息记录',
                    style: TextStyle(color: GlassTheme.textLightGray),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                reverse: true,
                itemCount: messages.length + 1,
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return _buildLoadMore(roomId);
                  }

                  final item = messages[index];
                  final message = item.message;
                  final isSelf = chatController.isSelf(item);
                  final timeStr = message.createTime != null
                      ? "${message.createTime!.hour}:${message.createTime!.minute.toString().padLeft(2, '0')}"
                      : '';

                  return _buildMessageBubble(
                    isSelf,
                    item,
                    timeStr,
                    () => chatController.retrySend(item.clientId ?? ''),
                  );
                },
              );
            }),
          ),
          Obx(
            () => InputToolbar(
              enabled: chatController.activeRoomId.value != null,
              onSend: (text) => chatController.sendTextMessage(text),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMore(int roomId) {
    final chatController = Request.chat;

    if (chatController.isHistoryLoading(roomId)) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    if (!chatController.hasMoreHistory(roomId)) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Center(
          child: Text(
            '没有更多消息了',
            style: TextStyle(color: GlassTheme.textLightGray, fontSize: 12),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Center(
        child: TextButton(
          onPressed: () => chatController.loadMoreHistory(roomId),
          child: const Text('加载更早消息'),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(
    bool isSelf,
    ChatMessageItem item,
    String time,
    VoidCallback onRetry,
  ) {
    final message = item.message;
    final avatar = message.fromUserAvatar ?? '';
    final sender = message.fromUserName ?? '未知用户';
    final deliveryState = Request.chat.deliveryState(item);
    final isRecalled = message.status == 1;
    final content = isRecalled ? '消息已撤回' : (message.content ?? '');

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: isSelf
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSelf) ...[
            MallChatAvatar(
              size: TDAvatarSize.medium,
              avatarUrl: avatar.isNotEmpty
                  ? avatar
                  : 'https://api.dicebear.com/7.x/notionists/svg?seed=Guest&backgroundColor=e2e8f0',
            ),
            const SizedBox(width: 10),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isSelf
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isSelf)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4, left: 2),
                    child: Text(
                      sender,
                      style: const TextStyle(
                        color: GlassTheme.textLightGray,
                        fontSize: 11,
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelf
                        ? GlassTheme.primaryBlue
                        : GlassTheme.cardWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSelf ? 16 : 4),
                      topRight: Radius.circular(isSelf ? 4 : 16),
                      bottomLeft: const Radius.circular(16),
                      bottomRight: const Radius.circular(16),
                    ),
                    boxShadow: GlassTheme.softShadow,
                  ),
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelf
                          ? GlassTheme.cardWhite
                          : GlassTheme.textDark,
                      fontStyle: isRecalled
                          ? FontStyle.italic
                          : FontStyle.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: GlassTheme.textLightGray,
                        fontSize: 11,
                      ),
                    ),
                    if (item.clientId != null) ...[
                      const SizedBox(width: 6),
                      _buildDeliveryLabel(deliveryState, onRetry),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (isSelf) ...[
            const SizedBox(width: 10),
            MallChatAvatar(
              size: TDAvatarSize.medium,
              avatarUrl: avatar.isNotEmpty
                  ? avatar
                  : 'https://api.dicebear.com/7.x/notionists/svg?seed=${Request.app.userProfile.value?.id ?? "Me"}&backgroundColor=e2e8f0',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDeliveryLabel(
    LocalMessageSendState state,
    VoidCallback onRetry,
  ) {
    switch (state) {
      case LocalMessageSendState.sending:
        return const Text(
          '发送中',
          style: TextStyle(fontSize: 11, color: GlassTheme.textLightGray),
        );
      case LocalMessageSendState.sent:
        return const Text(
          '已发送',
          style: TextStyle(fontSize: 11, color: GlassTheme.textLightGray),
        );
      case LocalMessageSendState.failed:
        return GestureDetector(
          onTap: onRetry,
          child: const Text(
            '发送失败，点击重试',
            style: TextStyle(fontSize: 11, color: Colors.redAccent),
          ),
        );
    }
  }
}
