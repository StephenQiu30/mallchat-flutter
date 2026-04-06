import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../controllers/chat_controller.dart';
import '../models/chat_room.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();

    return Container(
      color: const Color(0xFFF6F7F9),
      child: Column(
        children: [
          // Custom Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 12),
            child: Row(
              children: [
                const TDAvatar(
                  size: TDAvatarSize.medium,
                  type: TDAvatarType.normal,
                  shape: TDAvatarShape.circle,
                  avatarUrl: 'https://tdesign.gtimg.com/mobile/demos/avatar_1.png',
                ),
                const SizedBox(width: 12),
                const Text(
                  "消息",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(TDIcons.add, size: 24, color: Color(0xFF1F2937)),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 8),
                    child: Icon(TDIcons.search, size: 20, color: Color(0xFF9CA3AF)),
                  ),
                  Text(
                    '搜索联系人、群聊...',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
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
                  final isActive = chatController.activeRoomId.value == room.id;
                  
                  return Slidable(
                    key: ValueKey(room.id),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => chatController.markAsRead(room.id),
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          icon: Icons.mark_chat_read,
                          label: '已读',
                        ),
                        SlidableAction(
                          onPressed: (_) => chatController.deleteRoom(room.id),
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

  Widget _buildChatCell(ChatRoom room, bool isActive) {
    final chatController = Get.find<ChatController>();
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => chatController.selectRoom(room.id),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar with Badge
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    TDAvatar(
                      size: TDAvatarSize.large,
                      type: TDAvatarType.normal,
                      shape: room.isGroup ? TDAvatarShape.square : TDAvatarShape.circle,
                      avatarUrl: room.avatar,
                    ),
                    if (room.unreadCount > 0)
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
                            room.unreadCount.toString(),
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
                              room.name,
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
                            room.time,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        room.topMessage,
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

