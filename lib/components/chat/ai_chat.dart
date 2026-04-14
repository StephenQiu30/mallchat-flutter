import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class AiChat extends StatelessWidget {
  const AiChat({super.key});

  @override
  Widget build(BuildContext context) {
    // A separate theme color for AI (Emerald Green)
    const aiColor = Color(0xFF10A37F);

    return Column(
      children: [
        // AI Header
        Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.95),
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.auto_awesome, color: aiColor, size: 22),
              const SizedBox(width: 10),
              const Text(
                "LangChain4j 智能助手",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: aiColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "DashScope Qwen-Max",
                  style: TextStyle(
                    color: aiColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // AI Messages List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            children: [
              _buildAiMessage(
                "✨",
                "已捕获到高频讨论主题：[环境部署]。\n\n👉 根据知识库，推荐使用 `docker-compose up -d` 快速启动 Nacos 与 ES 等中间件，日志已同步写入 ELK 平台。需要帮您导出部署文档吗？",
              ),
            ],
          ),
        ),

        // AI Input Area (Floating style)
        Container(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.white, Colors.white.withValues(alpha: 0.0)],
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const TextField(
                      maxLines: 4,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "给 MallChat 助手发送消息...",
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          TDIcons.link,
                          color: Colors.grey.shade500,
                          size: 20,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: aiColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          icon: const Text("发送"),
                          label: const Icon(Icons.send, size: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Prompt: 145 tokens | Completion: 268 tokens | Model: Qwen-Max",
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAiMessage(String avatar, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF10A37F), Color(0xFF047857)],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            avatar,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              text,
              style: const TextStyle(
                height: 1.6,
                fontSize: 14.5,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
