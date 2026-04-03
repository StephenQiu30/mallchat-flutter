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

    return Column(
      children: [
        // Header
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            border: Border(bottom: BorderSide(color: Colors.black.withValues(alpha: 0.05), width: 0.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "聊天室: ${chatController.activeRoomId.value}", 
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1D2129)),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.phone_iphone, size: 12, color: Color(0xFF2BA471)),
                      SizedBox(width: 4),
                      Text("iPhone 在线", style: TextStyle(fontSize: 11, color: Color(0xFF86909C))),
                    ],
                  ),
                ],
              )),
              Row(
                children: [
                  _buildHeaderAction(TDIcons.search),
                  const SizedBox(width: 12),
                  _buildHeaderAction(TDIcons.usergroup),
                  const SizedBox(width: 12),
                  _buildHeaderAction(TDIcons.more),
                ],
              )
            ],
          ),
        ),
        
        // Message ListView
        Expanded(
          child: Container(
            color: const Color(0xFFF6F7F9),
            child: Obx(() {
              final messages = chatController.currentMessages;
              if (messages.isEmpty) return const Center(child: Text("暂无消息记录", style: TextStyle(color: Color(0xFF86909C))));

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  // Show date separator logically (simplified here)
                  return _buildMessageBubble(context, msg.isSelf, msg.senderAvatar, msg.senderName, msg.content, "14:30");
                },
              );
            }),
          ),
        ),
        
        // Input Toolbar
        InputToolbar(
          onSend: (text) => chatController.sendMessage(text),
        ),
      ],
    );
  }

  Widget _buildHeaderAction(IconData icon) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: const Color(0xFF4E5969), size: 22),
      ),
    );
  }

  Widget _buildMessageBubble(BuildContext context, bool isSelf, String avatar, String sender, String content, String time) {
    final primaryColor = Theme.of(context).primaryColor;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSelf) ...[
            _buildAvatar(avatar),
            const SizedBox(width: 12),
          ],
          
          Flexible(
            child: Column(
              crossAxisAlignment: isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isSelf)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, left: 4),
                    child: Text(sender, style: const TextStyle(color: Color(0xFF86909C), fontSize: 12)),
                  ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // The Bubble
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: isSelf 
                          ? LinearGradient(
                              colors: [primaryColor, primaryColor.withBlue(250)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                        color: isSelf ? null : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(isSelf ? 16 : 4),
                          bottomRight: Radius.circular(isSelf ? 4 : 16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelf 
                              ? primaryColor.withValues(alpha: 0.2) 
                              : Colors.black.withValues(alpha: 0.04), 
                            blurRadius: 10, 
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Text(
                        content,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.4,
                          color: isSelf ? Colors.white : const Color(0xFF1D2129),
                        ),
                      ),
                    ),
                    // Optional Status/Time for self
                    if (isSelf)
                      Positioned(
                        left: -45,
                        bottom: 0,
                        child: Text(time, style: const TextStyle(fontSize: 10, color: Color(0xFFC9CDD4))),
                      ),
                  ],
                ),
              ],
            ),
          ),
          
          if (isSelf) ...[
            const SizedBox(width: 12),
            _buildAvatar(avatar),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))
        ],
      ),
      child: TDAvatar(size: TDAvatarSize.large, avatarUrl: url),
    );
  }
}

