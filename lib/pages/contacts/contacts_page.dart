import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/models/chat_friend_user_vo.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:mallchat_flutter/pages/chat/chat_detail_page.dart';
import 'package:mallchat_flutter/pages/contacts/friend_apply_page.dart';
import 'package:mallchat_flutter/providers/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.read<ContactProvider>(),
      child: const _ContactsView(),
    );
  }
}

class _ContactsView extends StatefulWidget {
  const _ContactsView();

  @override
  State<_ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<_ContactsView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F7F9),
      child: Column(
        children: [
          _buildHeader(context),
          _buildSearchBar(context),
          Expanded(child: _buildBody(context)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
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
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
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
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            context.read<ContactProvider>().setSearchQuery(value);
          },
          decoration: const InputDecoration(
            hintText: '搜索联系人...',
            hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
            prefixIcon: Icon(TDIcons.search, size: 20, color: Color(0xFF9CA3AF)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, _) {
        return RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              provider.refreshFriends(),
              provider.refreshFriendApplies(reset: true),
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
                badgeCount: provider.pendingApplyCount,
                onTap: () => Get.to(() => const FriendApplyPage()),
              ),
              const SizedBox(height: 12),
              _buildFunctionalCard(
                title: '群通知',
                icon: TDIcons.notification,
                iconColor: const Color(0xFFF59E0B),
              ),
              const SizedBox(height: 24),
              if (provider.friends.isEmpty && !provider.contactLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      '暂无联系人',
                      style: TextStyle(color: Color(0xFF9CA3AF)),
                    ),
                  ),
                ),
              ...provider.groupedFriends.map(
                (group) => _buildAlphabetGroup(context, group.letter, group.friends),
              ),
            ],
          ),
        );
      },
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

  Widget _buildAlphabetGroup(
    BuildContext context,
    String letter,
    List<ChatFriendUserVo> friends,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Future<void> _openFriendChat(
    BuildContext context,
    ChatFriendUserVo friend,
  ) async {
    final userId = friend.id;
    if (userId == null) return;

    final contactProvider = context.read<ContactProvider>();
    final roomId = await contactProvider.startPrivateChat(userId);
    if (roomId == null || !context.mounted) return;

    // 刷新会话列表
    Request.chat.refreshSessions();
    Request.chat.openSession(roomId);

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
                if (userId == null) return;
                await context.read<ContactProvider>().applyFriendByUserId(
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
