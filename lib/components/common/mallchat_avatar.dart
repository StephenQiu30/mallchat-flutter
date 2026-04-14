import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:mallchat_flutter/styles/glass_theme.dart';

/// 通用头像组件，支持 SVG 和普通图片格式
/// 解决了 Flutter 原生 Image 组件不支持 SVG 的问题
class MallChatAvatar extends StatelessWidget {
  final String avatarUrl;
  final TDAvatarSize size;
  final TDAvatarShape shape;
  final TDAvatarType type;
  final VoidCallback? onTap;

  const MallChatAvatar({
    super.key,
    required this.avatarUrl,
    this.size = TDAvatarSize.medium,
    this.shape = TDAvatarShape.circle,
    this.type = TDAvatarType.normal,
    this.onTap,
  });

  bool get _isSvg =>
      avatarUrl.toLowerCase().contains('.svg') ||
      avatarUrl.toLowerCase().contains('svg?') ||
      avatarUrl.startsWith('data:image/svg+xml');

  @override
  Widget build(BuildContext context) {
    if (_isSvg) {
      double dimension = _getDimension(size);
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: dimension,
          height: dimension,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: GlassTheme.backgroundGray,
            shape: shape == TDAvatarShape.circle
                ? BoxShape.circle
                : BoxShape.rectangle,
            borderRadius: shape == TDAvatarShape.circle
                ? null
                : BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
          child: SvgPicture.network(
            avatarUrl,
            fit: BoxFit.cover,
            placeholderBuilder: (BuildContext context) => Container(
              color: GlassTheme.backgroundGray.withValues(alpha: 0.5),
              child: const Center(
                child: Icon(
                  TDIcons.user,
                  color: GlassTheme.textLightGray,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // 默认回退到 TDAvatar，它处理了普通的网络图片
    return TDAvatar(
      size: size,
      shape: shape,
      type: type,
      avatarUrl: avatarUrl,
      onTap: onTap,
    );
  }

  double _getDimension(TDAvatarSize size) {
    switch (size) {
      case TDAvatarSize.large:
        return 56.0;
      case TDAvatarSize.medium:
        return 48.0;
      case TDAvatarSize.small:
        return 40.0;
    }
  }
}
