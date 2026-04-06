import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';

class ChatStore extends GetxController {
  // --- Clients ---
  // 通过 Request.getInstance() 获取配置好的 Dio 实例
  late final ChatClient _client = ChatClient(Request.getInstance());

  // --- State ---
  var chatRooms = <ChatRoomVo>[].obs;
  var activeRoomId = RxnInt();
  var currentMessages = <ChatMessageVo>[].obs;
  var unreadCounts = <int, int>{}.obs;
  var lastMessages = <int, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  /// 初始化加载（后续可改为真正调用 API）
  void _loadInitialData() {
    // 暂存 Mock 数据以保证 UI 可用
    chatRooms.assignAll([
      const ChatRoomVo(
        id: 1,
        name: 'MallChat 官方交流群',
        avatar: 'https://api.dicebear.com/7.x/identicon/svg?seed=mallchat',
        type: 1,
      ),
      const ChatRoomVo(
        id: 2,
        name: 'Alice (架构师)',
        avatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Alice',
        type: 2,
      ),
    ]);

    if (chatRooms.isNotEmpty) {
      // 填充 Mock 数据
      lastMessages[1] = '[图片] 本周架构优化报告已生成。';
      lastMessages[2] = '那个 RabbitMQ 的 ACK 机制我这里再调一下。';
      unreadCounts[2] = 3;
      
      selectRoom(chatRooms.first.id!);
    }
  }

  /// 切换聊天室
  void selectRoom(int roomId) {
    activeRoomId.value = roomId;
    markAsRead(roomId);
    
    // TODO: 真正的 API 调用
  }

  /// 标记已读
  void markAsRead(int roomId) {
    unreadCounts[roomId] = 0;
  }

  /// 删除聊天室
  void deleteRoom(int roomId) {
    chatRooms.removeWhere((r) => r.id == roomId);
    unreadCounts.remove(roomId);
    lastMessages.remove(roomId);
    
    if (activeRoomId.value == roomId && chatRooms.isNotEmpty) {
      selectRoom(chatRooms.first.id!);
    } else if (chatRooms.isEmpty) {
      activeRoomId.value = null;
      currentMessages.clear();
    }
  }

  /// 发送消息
  Future<void> sendMessage(String content) async {
    if (content.isEmpty || activeRoomId.value == null) return;

    final roomId = activeRoomId.value!;
    
    // 1. 本地立即更新 (Optimistic UI)
    final tempMsg = ChatMessageVo(
      id: DateTime.now().millisecondsSinceEpoch,
      roomId: roomId,
      fromUserId: 999, // 假设当前用户ID
      fromUserName: 'Me',
      content: content,
      createTime: DateTime.now(),
    );
    currentMessages.insert(0, tempMsg);
    lastMessages[roomId] = content;

    // 2. 真正调用后端 API
    try {
      await _client.chatMessageController.sendMessage(
        body: ChatMessageSendRequest(
          roomId: roomId,
          content: content,
          type: 1, // 1-文本
        ),
      );
    } catch (e) {
      // 错误已由 Request Interceptor 弹出 Toast
    }
  }

  bool isSelf(ChatMessageVo msg) => msg.fromUserId == 999;
}
