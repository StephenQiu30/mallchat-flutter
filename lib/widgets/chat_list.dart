import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Area
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: TDSearchBar(
            needCancel: false,
            placeHolder: '搜索联系人、群聊...',
            style: TDSearchStyle.round,
          ),
        ),
        
        // List Area
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildChatCell(
                name: "MallChat 官方交流群",
                time: "10:42",
                msg: "[AI 助手]: 本周架构优化报告已生成。",
                avatarUrl: "https://api.dicebear.com/7.x/identicon/svg?seed=mallchat&backgroundColor=c0aede",
                isActive: true,
              ),
              _buildChatCell(
                name: "Alice (架构师)",
                time: "昨天",
                msg: "那个 RabbitMQ 的 ACK 机制我这里再调一下。",
                avatarUrl: "https://api.dicebear.com/7.x/notionists/svg?seed=Alice&backgroundColor=fcd34d",
                unread: true,
              ),
              _buildChatCell(
                name: "运维小哥",
                time: "星期二",
                msg: "Nacos 配置已经同步了。",
                avatarUrl: "https://api.dicebear.com/7.x/notionists/svg?seed=Bob&backgroundColor=a7f3d0",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildChatCell({
    required String name,
    required String time,
    required String msg,
    required String avatarUrl,
    bool isActive = false,
    bool unread = false,
  }) {
    return Container(
      color: isActive ? const Color(0xFF0052D9).withValues(alpha: 0.08) : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Avatar with optional unread badge
          Stack(
            children: [
              TDAvatar(
                size: TDAvatarSize.large,
                type: TDAvatarType.normal,
                avatarUrl: avatarUrl,
              ),
              if (unread)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          // Info Series
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF888888)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  msg,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
