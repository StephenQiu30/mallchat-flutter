import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:mallchat_flutter/store/app_store.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = Request.app;
    final chatStore = Request.chat;

    return Container(
      width: 72,
      decoration: BoxDecoration(
        color: const Color(0xFFE3E5E8).withValues(alpha: 0.9),
        border: Border(
          right: BorderSide(
            color: Colors.black.withValues(alpha: 0.05),
            width: 0.5,
          ),
        ),
      ),
      child: Obx(() {
        final currentIndex = appStore.currentNavIndex.value;
        return Column(
          children: [
            const SizedBox(height: 40),
            _buildUserAvatar(),
            const SizedBox(height: 32),
            _buildNavItem(
              TDIcons.chat_bubble_1,
              0,
              currentIndex,
              appStore,
              context,
              badge: chatStore.unreadBadgeLabel,
            ),
            const SizedBox(height: 12),
            _buildNavItem(TDIcons.user, 1, currentIndex, appStore, context),
            const SizedBox(height: 12),
            _buildNavItem(
              TDIcons.user_circle,
              2,
              currentIndex,
              appStore,
              context,
            ),
            const Spacer(),
            _buildNavItem(
              TDIcons.more,
              98,
              currentIndex,
              appStore,
              context,
              enabled: false,
            ),
            const SizedBox(height: 12),
            _buildNavItem(
              TDIcons.setting,
              99,
              currentIndex,
              appStore,
              context,
              enabled: false,
            ),
            const SizedBox(height: 24),
          ],
        );
      }),
    );
  }

  Widget _buildUserAvatar() {
    final user = Request.app.userProfile.value;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: MallChatAvatar(
            size: TDAvatarSize.large,
            avatarUrl:
                user?.userAvatar ??
                'https://api.dicebear.com/7.x/notionists/svg?seed=${user?.id ?? "Guest"}&backgroundColor=e2e8f0',
          ),
        ),
        Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: const Color(0xFF2BA471),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(
    IconData iconData,
    int index,
    int currentIndex,
    AppStore controller,
    BuildContext context, {
    String? badge,
    bool enabled = true,
  }) {
    final isActive = currentIndex == index;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: enabled ? () => controller.changeNav(index) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: enabled && isActive ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Icon(
              iconData,
              size: 26,
              color: enabled
                  ? (isActive ? Colors.white : const Color(0xFF5F6368))
                  : const Color(0xFFB8BDC5),
            ),
            if (badge != null)
              Positioned(
                top: 4,
                right: 4,
                child: TDBadge(TDBadgeType.message, count: badge),
              ),
          ],
        ),
      ),
    );
  }
}
