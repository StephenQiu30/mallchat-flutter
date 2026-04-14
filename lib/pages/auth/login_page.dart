import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallchat_flutter/utils/app_toast.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final theme = TDTheme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final topSpacing = screenHeight < 760 ? 24.0 : 40.0;

    return Scaffold(
      backgroundColor: theme.bgColorPage,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.bgColorPage,
              Color.alphaBlend(
                theme.brandNormalColor.withValues(alpha: 0.05),
                theme.bgColorPage,
              ),
              theme.bgColorPage,
            ],
            stops: const [0, 0.32, 1],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -72,
              left: -24,
              right: -24,
              child: IgnorePointer(
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.brandNormalColor.withValues(alpha: 0.10),
                        theme.brandNormalColor.withValues(alpha: 0.02),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.fromLTRB(
                  20,
                  topSpacing,
                  20,
                  24 + MediaQuery.viewInsetsOf(context).bottom,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _BrandHeader(),
                        const SizedBox(height: 24),
                        _LoginCard(controller: controller),
                        const SizedBox(height: 16),
                        _AgreementSection(controller: controller),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) {
    final theme = TDTheme.of(context);

    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: theme.bgColorContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.brandNormalColor.withValues(alpha: 0.20),
            ),
            boxShadow: [
              BoxShadow(
                color: theme.brandNormalColor.withValues(alpha: 0.08),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(TDIcons.chat, size: 28, color: theme.brandNormalColor),
        ),
        const SizedBox(height: 16),
        Text(
          'MallChat',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: theme.textColorPrimary,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '连接沟通，创造价值',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: theme.textColorSecondary,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}

class _LoginCard extends StatefulWidget {
  const _LoginCard({required this.controller});

  final LoginController controller;

  @override
  State<_LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_handleTabChange)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = TDTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.bgColorContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.componentStrokeColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TDTabBar(
            controller: _tabController,
            tabs: const [
              TDTab(text: '快捷登录'),
              TDTab(text: '邮件登录'),
            ],
            height: 40,
            outlineType: TDTabBarOutlineType.capsule,
            showIndicator: false,
            dividerHeight: 0,
            backgroundColor: theme.bgColorSecondaryContainer,
            selectedBgColor: theme.bgColorContainer,
            unSelectedBgColor: theme.bgColorSecondaryContainer,
            labelColor: theme.brandNormalColor,
            unselectedLabelColor: theme.textColorSecondary,
          ),
          const SizedBox(height: 20),
          if (_tabController.index == 0)
            _QuickLoginPanel(controller: widget.controller)
          else
            _EmailLoginPanel(controller: widget.controller),
        ],
      ),
    );
  }
}

class _QuickLoginPanel extends StatelessWidget {
  const _QuickLoginPanel({required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    final theme = TDTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '使用常用方式快速登录',
          style: TextStyle(
            fontSize: 13,
            color: theme.textColorSecondary,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => TDButton(
            text: controller.isLoading.value ? '登录中...' : '微信一键登录',
            size: TDButtonSize.large,
            theme: TDButtonTheme.primary,
            type: TDButtonType.fill,
            isBlock: true,
            onTap: controller.isLoading.value
                ? null
                : controller.loginWithWechat,
          ),
        ),
        const SizedBox(height: 12),
        TDButton(
          text: 'Apple 登录',
          size: TDButtonSize.large,
          type: TDButtonType.outline,
          theme: TDButtonTheme.defaultTheme,
          isBlock: true,
          onTap: () => AppToast.showText('Apple 登录暂未开放'),
        ),
      ],
    );
  }
}

class _EmailLoginPanel extends StatelessWidget {
  const _EmailLoginPanel({required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    final theme = TDTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '使用邮箱验证码登录',
          style: TextStyle(
            fontSize: 13,
            color: theme.textColorSecondary,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 16),
        TDInput(
          width: double.infinity,
          type: TDInputType.cardStyle,
          cardStyle: TDCardStyle.topText,
          cardStyleTopText: '邮箱',
          hintText: '请输入邮箱',
          inputType: TextInputType.emailAddress,
          onChanged: (value) => controller.email.value = value,
        ),
        const SizedBox(height: 12),
        TDInput(
          width: double.infinity,
          type: TDInputType.cardStyle,
          cardStyle: TDCardStyle.topText,
          cardStyleTopText: '验证码',
          hintText: '请输入验证码',
          onChanged: (value) => controller.code.value = value,
          rightBtn: Obx(
            () => TDButton(
              text: controller.timerSeconds.value > 0
                  ? '${controller.timerSeconds.value}s'
                  : controller.isSendingCode.value
                  ? '发送中...'
                  : '发送验证码',
              size: TDButtonSize.small,
              type: TDButtonType.text,
              theme: TDButtonTheme.primary,
              onTap:
                  controller.timerSeconds.value > 0 ||
                      controller.isSendingCode.value
                  ? null
                  : controller.sendVerificationCode,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => TDButton(
            text: controller.isLoading.value ? '登录中...' : '登录',
            size: TDButtonSize.large,
            theme: TDButtonTheme.primary,
            type: TDButtonType.fill,
            isBlock: true,
            onTap: controller.isLoading.value
                ? null
                : controller.loginWithEmail,
          ),
        ),
      ],
    );
  }
}

class _AgreementSection extends StatelessWidget {
  const _AgreementSection({required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    final theme = TDTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.bgColorContainer.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Obx(
        () => TDCheckbox(
          checked: controller.isAgreed.value,
          size: TDCheckBoxSize.small,
          showDivider: false,
          backgroundColor: Colors.transparent,
          checkBoxLeftSpace: 0,
          insetSpacing: 10,
          customSpace: const EdgeInsets.symmetric(vertical: 2),
          onCheckBoxChanged: (_) => controller.toggleAgreement(),
          customContentBuilder: (context, checked, _) {
            return RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: theme.textColorSecondary,
                  height: 1.45,
                ),
                children: [
                  const TextSpan(text: '我已阅读并同意'),
                  TextSpan(
                    text: '《用户协议》',
                    style: TextStyle(
                      color: theme.textColorLink,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const TextSpan(text: ' 和 '),
                  TextSpan(
                    text: '《隐私政策》',
                    style: TextStyle(
                      color: theme.textColorLink,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
