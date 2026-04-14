import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputToolbar extends StatefulWidget {
  const InputToolbar({super.key, required this.onSend, this.enabled = true});

  final Function(String) onSend;
  final bool enabled;

  @override
  State<InputToolbar> createState() => _InputToolbarState();
}

class _InputToolbarState extends State<InputToolbar> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    if (!widget.enabled) {
      return;
    }
    if (_controller.text.trim().isNotEmpty) {
      widget.onSend(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildActionIcon(
            TDIcons.add_circle,
            color: const Color(0xFF9CA3AF),
            enabled: widget.enabled,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _controller,
                enabled: widget.enabled,
                maxLines: 4,
                minLines: 1,
                style: const TextStyle(fontSize: 15, color: Color(0xFF1F2937)),
                decoration: InputDecoration(
                  hintText: widget.enabled ? '发个消息吧...' : '请选择一个会话',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => _handleSend(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildActionIcon(
            TDIcons.smile,
            color: const Color(0xFF9CA3AF),
            enabled: widget.enabled,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: widget.enabled ? _handleSend : null,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: widget.enabled
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFF9CA3AF),
                shape: BoxShape.circle,
              ),
              child: const Icon(TDIcons.send, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, {Color? color, bool enabled = true}) {
    return InkWell(
      onTap: enabled ? () {} : null,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          color: enabled
              ? (color ?? const Color(0xFF4B5563))
              : const Color(0xFFD1D5DB),
          size: 26,
        ),
      ),
    );
  }
}
