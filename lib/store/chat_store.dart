import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/api/request.dart';
import 'package:mallchat_flutter/common/enums.dart';

class ChatStore extends GetxController {
  // --- Clients ---
  // 使用 Request 服务提供的 ChatClient
  late final ChatClient _client = Request.chatClient;

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

  /// 初始化加载（从服务端拉取真实房间列表）
  Future<void> _loadInitialData() async {
    await refreshRooms();
  }

  /// 刷新房间列表
  Future<void> refreshRooms() async {
    try {
      final response = await Request.chatClient.chatRoomController.listUserChatRooms();
      if (response.code == 0 && response.data != null) {
        chatRooms.assignAll(response.data!);
      }
    } catch (e) {
      // 错误已由拦截器处理
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
    
    final currentUser = Request.app.userProfile.value;
    
    // 1. 本地立即更新 (Optimistic UI)
    final tempMsg = ChatMessageVo(
      id: DateTime.now().millisecondsSinceEpoch,
      roomId: roomId,
      fromUserId: currentUser?.id ?? 0,
      fromUserName: currentUser?.userName ?? 'Me',
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
          type: MessageType.text.value,
        ),
      );
    } catch (e) {
      // 错误已由 Request Interceptor 弹出 Toast
    }
  }

  bool isSelf(ChatMessageVo msg) {
    final currentUserId = Request.app.userProfile.value?.id;
    return currentUserId != null && msg.fromUserId == currentUserId;
  }
}
