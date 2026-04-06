import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:mallchat_flutter/styles/glass_theme.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/api/chat/models/chat_room_vo.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:mallchat_flutter/pages/chat/chat_detail_page.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Request.chat;

    return Container(
      color: GlassTheme.backgroundGray,
      child: Column(
        children: [
          // Custom Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 12),
            child: Row(
              children: [
                const MallChatAvatar(
                  size: TDAvatarSize.medium,
                  avatarUrl: 'https://api.dicebear.com/7.x/notionists/svg?seed=Stephen&backgroundColor=e2e8f0',
                ),
                const SizedBox(width: 12),
                const Text(
                  "消息",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: GlassTheme.textDark,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(TDIcons.add, size: 24, color: GlassTheme.textDark),
                ),
              ],
            ),
          ),
          
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: GlassTheme.cardWhite,
                borderRadius: GlassTheme.radius24,
                boxShadow: GlassTheme.softShadow,
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 8),
                    child: Icon(TDIcons.search, size: 20, color: Color(0xFF9CA3AF)),
                  ),
                  Text(
                    '搜索联系人、群聊...',
                    style: TextStyle(color: GlassTheme.textLightGray, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          
          // Chat List
          Expanded(
            child: Obx(() {
              final rooms = chatController.chatRooms;
              
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  final roomId = room.id ?? 0;
                  final isActive = chatController.activeRoomId.value == roomId;
                  
                  return Slidable(
                    key: ValueKey(roomId),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => chatController.markAsRead(roomId),
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          icon: Icons.mark_chat_read,
                          label: '已读',
                        ),
                        SlidableAction(
                          onPressed: (_) => chatController.deleteRoom(roomId),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: '删除',
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildChatCell(room, isActive),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _buildChatCell(ChatRoomVo room, bool isActive) {
    final chatController = Request.chat;
    final roomId = room.id ?? 0;
    final unreadCount = chatController.unreadCounts[roomId] ?? 0;
    final lastMsg = chatController.lastMessages[roomId] ?? "";
    final isGroup = room.type == 1;
    
    // Simple time format for mock
    final timeStr = room.createTime != null ? "${room.createTime!.hour}:${room.createTime!.minute.toString().padLeft(2, '0')}" : "10:42";

    return Container(
      decoration: BoxDecoration(
        color: GlassTheme.cardWhite,
        borderRadius: GlassTheme.radius16,
        boxShadow: GlassTheme.mediumShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            chatController.selectRoom(roomId);
            Get.to(() => const ChatDetailPage());
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar with Badge
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    MallChatAvatar(
                      size: TDAvatarSize.large,
                      shape: isGroup ? TDAvatarShape.square : TDAvatarShape.circle,
                      avatarUrl: room.avatar ?? "",
                    ),
                    if (unreadCount > 0)
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF4444),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Text(
                            unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                // Message Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              room.name ?? "未知房间",
                              style: const TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.bold, 
                                color: Color(0xFF1F2937),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            timeStr,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        lastMsg,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280), height: 1.2),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

