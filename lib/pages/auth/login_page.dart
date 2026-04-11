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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  
                  // Logo & Brand
                  _buildBrandHeader(),
                  
                  const Spacer(),

                  // Tabs for Login Method
                  _buildLoginTabs(controller),

                  const SizedBox(height: 32),

                  // Agreement
                  _buildAgreementSection(controller),

                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginTabs(LoginController controller) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TDTabBar(
            tabs: [
              TDTab(text: '快捷登录'),
              TDTab(text: '邮件登录'),
            ],
            isScrollable: false,
            indicatorWidth: 24,
            labelColor: Color(0xFF3B82F6),
            unselectedLabelColor: Colors.grey,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200, // Fixed height for input area
            child: TabBarView(
              children: [
                _buildSocialLogin(controller), // Tab 1: WeChat/Apple
                _buildEmailLogin(controller),  // Tab 2: Email
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLogin(LoginController controller) {
    return Column(
      children: [
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
            : controller.loginWithMock,
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
          onTap: () => Get.snackbar('提示', 'Apple 登录暂未开放'),
        ),
      ],
    );
  }

  Widget _buildEmailLogin(LoginController controller) {
    return Column(
      children: [
        // Email Input
        TDInput(
          hintText: '请输入邮箱',
          type: TDInputType.normal,
          onChanged: (v) => controller.email.value = v,
          leftIcon: const Icon(TDIcons.mail),
          backgroundColor: Colors.white,
        ),
        
        const SizedBox(height: 12),

        // Code Input with Send Button
        TDInput(
          hintText: '验证码',
          type: TDInputType.normal,
          onChanged: (v) => controller.code.value = v,
          leftIcon: const Icon(TDIcons.secured),
          backgroundColor: Colors.white,
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

  Widget _buildAgreementSection(LoginController controller) {
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
