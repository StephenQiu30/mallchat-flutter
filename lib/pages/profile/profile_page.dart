import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:mallchat_flutter/components/common/mallchat_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F7F9),
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
            child: SingleChildScrollView(
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
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const MallChatAvatar(
                                size: TDAvatarSize.large,
                                avatarUrl: 'https://api.dicebear.com/7.x/notionists/svg?seed=Stephen&backgroundColor=e2e8f0',
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "MallChat Cloud",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1F2937),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "账号: mallchat_888",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF9CA3AF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(TDIcons.qrcode, size: 24, color: Colors.black.withValues(alpha: 0.3)),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Stats
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               _StatItem(label: "最近访问", count: "1.2k", icon: TDIcons.time),
                               _StatItem(label: "我的好友", count: "482", icon: TDIcons.user),
                               _StatItem(label: "收藏内容", count: "156", icon: TDIcons.star),
                             ],
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
                          _ServiceItem(icon: TDIcons.wallet, title: "我的钱包", subtitle: "288.50"),
                          _ServiceItem(icon: TDIcons.app, title: "个性装扮", subtitle: "限时折扣"),
                        ]),
                        const SizedBox(height: 16),
                        _buildServiceGroup([
                          _ServiceItem(icon: TDIcons.star, title: "我的收藏"),
                          _ServiceItem(icon: TDIcons.file_copy, title: "文件传输助手"),
                          _ServiceItem(icon: TDIcons.image, title: "相册动态"),
                        ]),
                        const SizedBox(height: 16),
                        _buildServiceGroup([
                          _ServiceItem(icon: TDIcons.edit_1, title: "意见反馈"),
                          _ServiceItem(icon: TDIcons.info_circle, title: "关于 MallChat"),
                        ]),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
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
        Icon(icon, size: 24, color: const Color(0xFF3B82F6).withValues(alpha: 0.8)),
        const SizedBox(height: 8),
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9CA3AF),
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
              Icon(icon, size: 24, color: const Color(0xFF3B82F6)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1F2937),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
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
