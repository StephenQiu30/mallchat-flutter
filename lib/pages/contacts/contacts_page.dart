import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/models/chat_friend_user_vo.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:mallchat_flutter/pages/chat/chat_detail_page.dart';
import 'package:mallchat_flutter/pages/contacts/friend_apply_page.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F7F9),
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
                  '联系人',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => _showAddFriendDialog(context),
                  icon: const Icon(
                    TDIcons.user_add,
                    size: 24,
                    color: Color(0xFF1F2937),
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
                    child: Icon(
                      TDIcons.search,
                      size: 20,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  Text(
                    '搜索联系人...',
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final contactStore = Request.contact;
              final friends = contactStore.sortedFriends;

              return RefreshIndicator(
                onRefresh: () async {
                  await Future.wait([
                    contactStore.refreshFriends(),
                    contactStore.refreshFriendApplies(reset: true),
                  ]);
                },
                displacement: 20,
                color: const Color(0xFF3B82F6),
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildFunctionalCard(
                      title: '新朋友',
                      icon: TDIcons.user_add,
                      iconColor: const Color(0xFF3B82F6),
                      badgeCount: contactStore.friendApplies
                          .where((item) => item.status == 1)
                          .length,
                      onTap: () => Get.to(() => const FriendApplyPage()),
                    ),
                    const SizedBox(height: 12),
                    _buildFunctionalCard(
                      title: '群通知',
                      icon: TDIcons.notification,
                      iconColor: const Color(0xFFF59E0B),
                    ),
                    const SizedBox(height: 24),
                    if (friends.isEmpty && !contactStore.contactLoading.value)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            '暂无联系人',
                            style: TextStyle(color: Color(0xFF9CA3AF)),
                          ),
                        ),
                      ),
                    if (friends.isNotEmpty)
                      _buildExpandableGroup(
                        context,
                        '我的好友',
                        '${friends.length}/${friends.length}',
                        friends,
                      ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionalCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    int badgeCount = 0,
    VoidCallback? onTap,
  }) {
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, size: 20, color: iconColor),
                    ),
                    if (badgeCount > 0)
                      Positioned(
                        top: -4,
                        right: -4,
                        child: TDBadge(
                          TDBadgeType.message,
                          count: badgeCount > 99 ? '99+' : '$badgeCount',
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const Spacer(),
                const Icon(
                  TDIcons.chevron_right,
                  size: 20,
                  color: Color(0xFF9CA3AF),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableGroup(
    BuildContext context,
    String title,
    String status,
    List<ChatFriendUserVo> friends,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(color: Colors.white),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              status,
              style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
            ),
            const SizedBox(width: 4),
            const Icon(
              TDIcons.chevron_down,
              size: 16,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),
        children: friends
            .map(
              (friend) => ListTile(
                onTap: () => _openFriendChat(context, friend),
                leading: MallChatAvatar(
                  size: TDAvatarSize.small,
                  avatarUrl:
                      friend.userAvatar ??
                      'https://api.dicebear.com/7.x/notionists/svg?seed=${friend.id}&backgroundColor=f3f4f6',
                ),
                title: Text(
                  friend.userName ?? '未知用户',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _openFriendChat(
    BuildContext context,
    ChatFriendUserVo friend,
  ) async {
    final userId = friend.id;
    if (userId == null) {
      return;
    }

    final roomId = await Request.contact.startPrivateChat(userId);
    if (roomId == null || !context.mounted) {
      return;
    }

    if (MediaQuery.of(context).size.width >= 800) {
      Request.app.changeNav(0);
      return;
    }

    Get.to(() => const ChatDetailPage());
  }

  Future<void> _showAddFriendDialog(BuildContext context) async {
    final idController = TextEditingController();
    final messageController = TextEditingController(text: '你好，我想添加你为好友');

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('添加好友'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '用户 ID',
                  hintText: '请输入目标用户 ID',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: messageController,
                decoration: const InputDecoration(labelText: '申请消息'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                final userId = int.tryParse(idController.text.trim());
                if (userId == null) {
                  return;
                }
                await Request.contact.applyFriendByUserId(
                  userId,
                  messageController.text.trim(),
                );
                if (dialogContext.mounted) {
                  Navigator.of(dialogContext).pop();
                }
              },
              child: const Text('发送申请'),
            ),
          ],
        );
      },
    );
  }
}
