import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ChatAreaWidget extends StatelessWidget {
  const ChatAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Header
        Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.95),
            border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("MallChat 官方交流群", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 8),
                  Text("(42人)", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                ],
              ),
              Row(
                children: [
                  Icon(TDIcons.search, color: Colors.grey.shade600, size: 24),
                  const SizedBox(width: 16),
                  Icon(TDIcons.bulletpoint, color: Colors.grey.shade600, size: 24),
                ],
              )
            ],
          ),
        ),
        
        // 2. Message List (Using reverse ListView)
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            reverse: true, // Newest message at the bottom
            children: [
              _buildMessageBubble(
                context,
                isSelf: true,
                avatar: "https://api.dicebear.com/7.x/notionists/svg?seed=Stephen&backgroundColor=e2e8f0",
                sender: "Me",
                content: "收到，我这边的 RabbitMQ 消息补偿机制已经上线了，可以随便测没问题。",
              ),
              const SizedBox(height: 20),
              _buildMessageBubble(
                context,
                isSelf: false,
                avatar: "https://api.dicebear.com/7.x/notionists/svg?seed=Alice&backgroundColor=fcd34d",
                sender: "Alice",
                content: "大家早上好！今天主要针对 MallChat 的 AI总结功能做测试。",
              ),
              const SizedBox(height: 20),
              // Simulate older messages pushed up
              Center(child: Text("10:35 AM", style: TextStyle(color: Colors.grey.shade500, fontSize: 12))),
            ],
          ),
        ),
        
        // 3. Input Area
        Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
          ),
          child: Column(
            children: [
              // Toolbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(TDIcons.smile, color: Colors.grey.shade600, size: 22),
                    const SizedBox(width: 16),
                    Icon(TDIcons.folder, color: Colors.grey.shade600, size: 22),
                    const SizedBox(width: 16),
                    Icon(TDIcons.time, color: Colors.grey.shade600, size: 22),
                    const Spacer(),
                    Icon(TDIcons.precise_monitor, color: Theme.of(context).primaryColor, size: 22),
                  ],
                ),
              ),
              // Input & Send button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "输入消息...",
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Enter 发送 / Shift+Enter 换行", style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      onPressed: () {},
                      child: const Text("发送"),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMessageBubble(BuildContext context, {required bool isSelf, required String avatar, required String sender, required String content}) {
    final primaryColor = Theme.of(context).primaryColor;
    
    return Row(
      mainAxisAlignment: isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isSelf) ...[
          TDAvatar(size: TDAvatarSize.large, avatarUrl: avatar),
          const SizedBox(width: 12),
        ],
        
        Flexible(
          child: Column(
            crossAxisAlignment: isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isSelf)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 4),
                  child: Text(sender, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelf ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: Radius.circular(isSelf ? 12 : 2),
                    bottomRight: Radius.circular(isSelf ? 2 : 12),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))
                  ],
                ),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 14.5,
                    height: 1.5,
                    color: isSelf ? Colors.white : const Color(0xFF333333),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        if (isSelf) ...[
          const SizedBox(width: 12),
          TDAvatar(size: TDAvatarSize.large, avatarUrl: avatar),
        ],
      ],
    );
  }
}
