import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../controllers/chat_controller.dart';
import '../widgets/input_toolbar.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(TDIcons.chevron_left, color: Color(0xFF1F2937)),
          onPressed: () => Get.back(),
        ),
        title: Obx(() => Column(
          children: [
            Text(
              "聊天室: ${chatController.activeRoomId.value}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const Text(
              "iPhone 在线",
              style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
            ),
          ],
        )),
        actions: [
          IconButton(
            icon: const Icon(TDIcons.more, color: Color(0xFF1F2937)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Message ListView
          Expanded(
            child: Obx(() {
              final messages = chatController.currentMessages;
              if (messages.isEmpty) {
                return const Center(
                  child: Text("暂无消息记录", style: TextStyle(color: Color(0xFF9CA3AF))),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return _buildMessageBubble(context, msg.isSelf, msg.senderAvatar, msg.senderName, msg.content, "14:30");
                },
              );
            }),
          ),
          
          // Input Toolbar
          InputToolbar(
            onSend: (text) => chatController.sendMessage(text),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(BuildContext context, bool isSelf, String avatar, String sender, String content, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSelf) ...[
            TDAvatar(size: TDAvatarSize.medium, avatarUrl: avatar),
            const SizedBox(width: 10),
          ],
          
          Flexible(
            child: Column(
              crossAxisAlignment: isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isSelf)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4, left: 2),
                    child: Text(sender, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11)),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelf ? const Color(0xFF3B82F6) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSelf ? 16 : 4),
                      topRight: Radius.circular(isSelf ? 4 : 16),
                      bottomLeft: const Radius.circular(16),
                      bottomRight: const Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelf ? Colors.white : const Color(0xFF1F2937),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          if (isSelf) ...[
            const SizedBox(width: 10),
            TDAvatar(size: TDAvatarSize.medium, avatarUrl: avatar),
          ],
        ],
      ),
    );
  }
}

