import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../controllers/chat_controller.dart';
import '../models/chat_room.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();

    return Column(
      children: [
        // Top Search Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: TDSearchBar(
            needCancel: false,
            placeHolder: '搜索联系人、群聊...',
            style: TDSearchStyle.round,
          ),
        ),
        
        // Chat List (Reactive)
        Expanded(
          child: Obx(() {
            final rooms = chatController.chatRooms;
            
            return ListView.builder(
              padding: EdgeInsets.zero,
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
                        backgroundColor: const Color(0xFF0052D9),
                        foregroundColor: Colors.white,
                        icon: Icons.mark_chat_read,
                        label: '标为已读',
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
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => chatController.selectRoom(room.id),
                    child: _buildChatCell(room, isActive),
                  ),
                );
              },
            );
          }),
        )
      ],
    );
  }

  Widget _buildChatCell(ChatRoom room, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: InkWell(
        onTap: () => Get.find<ChatController>().selectRoom(room.id),
        borderRadius: BorderRadius.circular(8),
        hoverColor: Colors.black.withValues(alpha: 0.04),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF0052D9).withValues(alpha: 0.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                      child: TDBadge(
                        TDBadgeType.message,
                        count: room.unreadCount.toString(),
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
                            style: TextStyle(
                              fontSize: 14, 
                              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500, 
                              color: const Color(0xFF1D2129),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          room.time,
                          style: const TextStyle(fontSize: 11, color: Color(0xFF86909C)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      room.topMessage,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF86909C), height: 1.2),
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
    );
  }
}

