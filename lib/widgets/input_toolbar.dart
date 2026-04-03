import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputToolbar extends StatefulWidget {
  final Function(String) onSend;

  const InputToolbar({super.key, required this.onSend});

  @override
  State<InputToolbar> createState() => _InputToolbarState();
}

class _InputToolbarState extends State<InputToolbar> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSend(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black.withValues(alpha: 0.05), width: 0.5)),
      ),
      child: Column(
        children: [
          // Toolbar Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildActionIcon(TDIcons.smile, tooltip: "表情"),
                _buildActionIcon(TDIcons.image, tooltip: "图片"),
                _buildActionIcon(TDIcons.folder_add, tooltip: "文件"),
                _buildActionIcon(TDIcons.history, tooltip: "聊天记录"),
                const Spacer(),
                _buildActionIcon(TDIcons.precise_monitor, color: Theme.of(context).primaryColor, tooltip: "AI 辅助"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Input Box
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                maxLines: null,
                style: const TextStyle(fontSize: 15, color: Color(0xFF1D2129)),
                decoration: const InputDecoration(
                  hintText: "发个消息吧...",
                  hintStyle: TextStyle(color: Color(0xFFC9CDD4), fontSize: 14),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => _handleSend(),
              ),
            ),
          ),
          // Bottom Row (Send button)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Enter 发送 / Shift+Enter 换行", 
                  style: TextStyle(color: Color(0xFFC9CDD4), fontSize: 11),
                ),
                const SizedBox(width: 16),
                Material(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  elevation: 2,
                  shadowColor: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                  child: InkWell(
                    onTap: _handleSend,
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: const Text(
                        "发送", 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, {Color? color, String? tooltip}) {
    return Tooltip(
      message: tooltip ?? "",
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: color ?? const Color(0xFF4E5969), size: 22),
        ),
      ),
    );
  }
}

