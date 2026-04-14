import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:mallchat_flutter/styles/glass_theme.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FriendApplyPage extends StatelessWidget {
  const FriendApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactStore = Request.contact;

    return Scaffold(
      backgroundColor: GlassTheme.backgroundGray,
      appBar: AppBar(title: const Text('新朋友'), backgroundColor: Colors.white),
      body: Obx(() {
        final applies = contactStore.friendApplies;

        return RefreshIndicator(
          onRefresh: () => contactStore.refreshFriendApplies(reset: true),
          child: applies.isEmpty && !contactStore.friendApplyLoading.value
              ? ListView(
                  children: const [
                    SizedBox(height: 120),
                    Center(
                      child: Text(
                        '暂无新的好友申请',
                        style: TextStyle(color: GlassTheme.textLightGray),
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount:
                      applies.length +
                      (contactStore.friendApplyHasMore.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == applies.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: TextButton(
                            onPressed: () =>
                                contactStore.refreshFriendApplies(reset: false),
                            child: contactStore.friendApplyLoading.value
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('加载更多'),
                          ),
                        ),
                      );
                    }

                    final apply = applies[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: GlassTheme.softShadow,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MallChatAvatar(
                            size: TDAvatarSize.medium,
                            avatarUrl:
                                apply.userAvatar ??
                                'https://api.dicebear.com/7.x/notionists/svg?seed=${apply.userId ?? "friend"}&backgroundColor=f3f4f6',
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apply.userName ?? '未知用户',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  apply.msg?.isNotEmpty == true
                                      ? apply.msg!
                                      : '请求添加你为好友',
                                  style: const TextStyle(
                                    color: GlassTheme.textGray,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _buildActionRow(apply.id, apply.status),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      }),
    );
  }

  Widget _buildActionRow(int? applyId, int? status) {
    if (applyId == null) {
      return const SizedBox.shrink();
    }

    if (status == 1) {
      return Row(
        children: [
          OutlinedButton(
            onPressed: () => Request.contact.approveFriendApply(applyId, 3),
            child: const Text('忽略'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => Request.contact.approveFriendApply(applyId, 2),
            child: const Text('同意'),
          ),
        ],
      );
    }

    final label = status == 2 ? '已同意' : '已忽略';
    return Text(label, style: const TextStyle(color: GlassTheme.textLightGray));
  }
}
