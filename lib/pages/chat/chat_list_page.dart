import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/models/chat_session_vo.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/common/enums.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:mallchat_flutter/pages/chat/chat_detail_page.dart';
import 'package:mallchat_flutter/styles/glass_theme.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Request.chat;

    return Container(
      color: GlassTheme.backgroundGray,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 12),
            child: Row(
              children: [
                Obx(() {
                  final user = Request.app.userProfile.value;
                  return MallChatAvatar(
                    size: TDAvatarSize.medium,
                    avatarUrl:
                        user?.userAvatar ??
                        'https://api.dicebear.com/7.x/notionists/svg?seed=${user?.id ?? "Guest"}&backgroundColor=e2e8f0',
                  );
                }),
                const SizedBox(width: 12),
                const Text(
                  '消息',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: GlassTheme.textDark,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Request.app.changeNav(1),
                  icon: const Icon(
                    TDIcons.add,
                    size: 24,
                    color: GlassTheme.textDark,
                  ),
                ),
              ],
            ),
          ),
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
                    child: Icon(
                      TDIcons.search,
                      size: 20,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  Text(
                    '搜索联系人、群聊...',
                    style: TextStyle(
                      color: GlassTheme.textLightGray,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final sessions = chatController.sessions;

              if (chatController.sessionLoading.value && sessions.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return RefreshIndicator(
                onRefresh: chatController.refreshSessions,
                displacement: 20,
                color: GlassTheme.primaryBlue,
                child: sessions.isEmpty
                    ? ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(height: 120),
                          Center(
                            child: Text(
                              '暂无会话，去联系人里发起聊天吧',
                              style: TextStyle(color: GlassTheme.textLightGray),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: sessions.length,
                        itemBuilder: (context, index) {
                          final session = sessions[index];
                          final roomId = session.roomId ?? 0;
                          final isActive =
                              chatController.activeRoomId.value == roomId;

                          return Slidable(
                            key: ValueKey(roomId),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (_) =>
                                      chatController.toggleSessionTop(
                                        roomId,
                                        (session.topStatus ?? 0) != 1,
                                      ),
                                  backgroundColor: const Color(0xFF3B82F6),
                                  foregroundColor: Colors.white,
                                  icon: (session.topStatus ?? 0) == 1
                                      ? Icons.vertical_align_bottom
                                      : Icons.vertical_align_top,
                                  label: (session.topStatus ?? 0) == 1
                                      ? '取消置顶'
                                      : '置顶',
                                ),
                                SlidableAction(
                                  onPressed: (_) =>
                                      chatController.deleteSession(roomId),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: '删除',
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _buildChatCell(context, session, isActive),
                            ),
                          );
                        },
                      ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildChatCell(
    BuildContext context,
    ChatSessionVo session,
    bool isActive,
  ) {
    final chatController = Request.chat;
    final roomId = session.roomId ?? 0;
    final unreadCount = session.unreadCount ?? 0;
    final lastMsg = session.lastMessage ?? '';
    final isGroup = session.type == RoomType.group.value;
    final timeStr = session.activeTime != null
        ? "${session.activeTime!.hour}:${session.activeTime!.minute.toString().padLeft(2, '0')}"
        : '刚刚';

    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFEFF6FF) : GlassTheme.cardWhite,
        borderRadius: GlassTheme.radius16,
        boxShadow: GlassTheme.mediumShadow,
        border: isActive
            ? Border.all(color: GlassTheme.primaryBlue.withValues(alpha: 0.2))
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await chatController.openSession(roomId);
            if (!context.mounted) {
              return;
            }
            if (MediaQuery.of(context).size.width < 800) {
              Get.to(() => const ChatDetailPage());
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    MallChatAvatar(
                      size: TDAvatarSize.large,
                      shape: isGroup
                          ? TDAvatarShape.square
                          : TDAvatarShape.circle,
                      avatarUrl: session.avatar ?? '',
                    ),
                    if (unreadCount > 0)
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF4444),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Text(
                            unreadCount > 99 ? '99+' : unreadCount.toString(),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              session.name ?? '未知会话',
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
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          if ((session.topStatus ?? 0) == 1) ...[
                            const Icon(
                              Icons.push_pin,
                              size: 14,
                              color: GlassTheme.primaryBlue,
                            ),
                            const SizedBox(width: 4),
                          ],
                          Expanded(
                            child: Text(
                              lastMsg.isNotEmpty ? lastMsg : '暂无消息',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                                height: 1.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
