import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/styles/glass_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlassTheme.backgroundGray,
      child: Stack(
        children: [
          // Background Gradient Header
          Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
              ),
            ),
          ),

          // Main Scrollable Content
          SafeArea(
            child: Obx(() {
              final user = Request.app.userProfile.value;
              return RefreshIndicator(
                onRefresh: () => Request.app.refreshUserProfile(),
                displacement: 20,
                color: GlassTheme.primaryBlue,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      // Header Row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(TDIcons.setting, color: Colors.white, size: 24),
                            ),
                          ],
                        ),
                      ),

                      // Profile Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: GlassTheme.radius24,
                          boxShadow: GlassTheme.mediumShadow,
                        ),
                        child: Row(
                          children: [
                            // 用户头像
                            MallChatAvatar(
                              size: TDAvatarSize.large,
                              avatarUrl: user?.userAvatar ?? 'https://api.dicebear.com/7.x/notionists/svg?seed=${user?.id ?? "Guest"}&backgroundColor=e2e8f0',
                            ),
                            const SizedBox(width: 16),
                            // 用户信息
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user?.userName ?? "未登录",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: GlassTheme.textDark,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  // 优化的 UID 展示 (胶囊样式)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: GlassTheme.backgroundGray,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "ID: ${user?.id ?? '---'}",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: GlassTheme.textGray,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Monospace', // 使用等宽字体更有科技感
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(TDIcons.copy, size: 12, color: Colors.blue.withValues(alpha: 0.6)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // 右侧二维码
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: GlassTheme.backgroundGray,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(TDIcons.qrcode, size: 20, color: Colors.black.withValues(alpha: 0.4)),
                            ),
                          ],
                        ),
                      ),
                      ),

                      // Service Sections
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Column(
                          children: [
                            _buildServiceGroup([
                              const _ServiceItem(icon: TDIcons.wallet, title: "我的钱包"),
                              const _ServiceItem(icon: TDIcons.app, title: "个性装扮"),
                            ]),
                            const SizedBox(height: 16),
                            _buildServiceGroup([
                              const _ServiceItem(icon: TDIcons.star, title: "我的收藏"),
                              const _ServiceItem(icon: TDIcons.file_copy, title: "文件传输助手"),
                              const _ServiceItem(icon: TDIcons.image, title: "相册动态"),
                            ]),
                            const SizedBox(height: 16),
                            _buildServiceGroup([
                              const _ServiceItem(icon: TDIcons.edit_1, title: "意见反馈"),
                              const _ServiceItem(icon: TDIcons.info_circle, title: "关于 MallChat"),
                            ]),
                            const SizedBox(height: 24),
                            // Logout Button
                            TDButton(
                              text: '退出登录',
                              size: TDButtonSize.large,
                              type: TDButtonType.fill,
                              theme: TDButtonTheme.danger,
                              width: double.infinity,
                              onTap: () => Request.app.logout(),
                            ),
                            const SizedBox(height: 48),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: GlassTheme.softShadow,
      ),
      child: Column(
        children: children.asMap().entries.map((entry) {
          final isLast = entry.key == children.length - 1;
          return Column(
            children: [
              entry.value,
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.only(left: 56),
                  child: Divider(
                    height: 1,
                    color: Colors.black.withValues(alpha: 0.03),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String count;
  final IconData icon;

  const _StatItem({required this.label, required this.count, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24, color: GlassTheme.primaryBlue.withValues(alpha: 0.8)),
        const SizedBox(height: 8),
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: GlassTheme.textDark,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: GlassTheme.textGray,
          ),
        ),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const _ServiceItem({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(icon, size: 24, color: GlassTheme.primaryBlue),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: GlassTheme.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 13, color: GlassTheme.textGray),
                ),
              const SizedBox(width: 4),
              const Icon(TDIcons.chevron_right, size: 20, color: Color(0xFFD1D5DB)),
            ],
          ),
        ),
      ),
    );
  }
}
