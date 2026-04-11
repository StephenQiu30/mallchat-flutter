import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:mallchat_flutter/styles/glass_theme.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFEFF6FF),
                  Color(0xFFDBEAFE),
                  Colors.white,
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    
                    // Logo & Brand
                    _buildBrandHeader(),
                    
                    const SizedBox(height: 60),

                    // Login Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.8),
                        borderRadius: GlassTheme.radius24,
                        boxShadow: GlassTheme.deepShadow,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                      ),
                      child: _buildLoginTabs(context, controller),
                    ),

                    const SizedBox(height: 32),

                    // Agreement
                    _buildAgreementSection(context, controller),

                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginTabs(BuildContext context, LoginController controller) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TDTabBar(
            tabs: const [
              TDTab(text: '快捷登录'),
              TDTab(text: '邮件登录'),
            ],
            isScrollable: false,
            indicatorWidth: 24,
            labelColor: GlassTheme.primaryBlue,
            unselectedLabelColor: GlassTheme.textLightGray,
            indicatorColor: GlassTheme.primaryBlue,
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 220, // Increased height for better spacing
            child: TabBarView(
              children: [
                _buildSocialLogin(context, controller),
                _buildEmailLogin(context, controller),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLogin(BuildContext context, LoginController controller) {
    return Column(
      children: [
        const SizedBox(height: 20),
        // WeChat Login Button
        Obx(() => TDButton(
          text: controller.isLoading.value ? '登录中...' : '微信一键登录',
          size: TDButtonSize.large,
          type: TDButtonType.fill,
          theme: TDButtonTheme.primary,
          shape: TDButtonShape.rectangle,
          width: double.infinity,
          onTap: controller.isLoading.value 
            ? null 
            : controller.loginWithWechat,
        )),
        
        const SizedBox(height: 16),

        // Apple Login Button
        TDButton(
          text: 'Apple 登录',
          size: TDButtonSize.large,
          type: TDButtonType.outline,
          theme: TDButtonTheme.defaultTheme,
          shape: TDButtonShape.rectangle,
          width: double.infinity,
          onTap: () => TDToast.showText('Apple 登录暂未开放', context: context),
        ),
      ],
    );
  }

  Widget _buildEmailLogin(BuildContext context, LoginController controller) {
    return Column(
      children: [
        // Email Input
        TDInput(
          hintText: '请输入邮箱',
          type: TDInputType.normal,
          onChanged: (v) => controller.email.value = v,
          leftIcon: const Icon(TDIcons.mail, color: GlassTheme.primaryBlue, size: 20),
          backgroundColor: GlassTheme.backgroundGray.withValues(alpha: 0.5),
        ),
        
        const SizedBox(height: 12),

        // Code Input with Send Button
        TDInput(
          hintText: '验证码',
          type: TDInputType.normal,
          onChanged: (v) => controller.code.value = v,
          leftIcon: const Icon(TDIcons.secured, color: GlassTheme.primaryBlue, size: 20),
          backgroundColor: GlassTheme.backgroundGray.withValues(alpha: 0.5),
          rightBtn: Obx(() => TDButton(
            text: controller.timerSeconds.value > 0 
              ? '${controller.timerSeconds.value}s' 
              : '发送验证码',
            size: TDButtonSize.small,
            type: TDButtonType.text,
            theme: TDButtonTheme.primary,
            onTap: controller.timerSeconds.value > 0 
              ? null 
              : controller.sendVerificationCode,
          )),
        ),
        
        const SizedBox(height: 24),

        // Email Login Submit
        Obx(() => TDButton(
          text: controller.isLoading.value ? '登录中...' : '登录',
          size: TDButtonSize.large,
          type: TDButtonType.fill,
          theme: TDButtonTheme.primary,
          shape: TDButtonShape.rectangle,
          width: double.infinity,
          onTap: controller.isLoading.value 
            ? null 
            : controller.loginWithEmail,
        )),
      ],
    );
  }

  Widget _buildBrandHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: GlassTheme.mediumShadow,
          ),
          child: const Center(
            child: Icon(
              TDIcons.chat,
              size: 40,
              color: Color(0xFF3B82F6),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "MallChat",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "连接沟通，创造价值",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildAgreementSection(BuildContext context, LoginController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => TDCheckbox(
          checked: controller.isAgreed.value,
          onCheckBoxChanged: (val) => controller.toggleAgreement(),
        )),
        const SizedBox(width: 4),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              children: const [
                TextSpan(text: "我已阅读并同意"),
                TextSpan(
                  text: "《用户协议》",
                  style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "和"),
                TextSpan(
                  text: "《隐私政策》",
                  style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
