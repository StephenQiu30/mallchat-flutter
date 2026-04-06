import 'package:get/get.dart';
import 'package:mallchat_flutter/api/chat/export.dart';

class ChatController extends GetxController {
  // Chat Rooms List
  var chatRooms = <ChatRoomVo>[].obs;
  
  // Currently Active Chat Room ID
  var activeRoomId = RxnInt();

  // Messages for active chat room
  var currentMessages = <ChatMessageVo>[].obs;

  // UI-specific state not present in VO
  var unreadCounts = <int, int>{}.obs;
  var lastMessages = <int, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadDummyData();
  }

  void _loadDummyData() {
    chatRooms.assignAll([
      const ChatRoomVo(
        id: 1,
        name: 'MallChat 官方交流群',
        avatar: 'https://api.dicebear.com/7.x/identicon/svg?seed=mallchat&backgroundColor=c0aede',
        type: 1, // Group
      ),
      const ChatRoomVo(
        id: 2,
        name: 'Alice (架构师)',
        avatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Alice&backgroundColor=fcd34d',
        type: 2, // Single
      ),
      const ChatRoomVo(
        id: 3,
        name: '运维小哥',
        avatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Bob&backgroundColor=a7f3d0',
        type: 2, // Single
      ),
    ]);

    // Fill UI states
    lastMessages[1] = '[图片] 本周架构优化报告已生成。';
    lastMessages[2] = '那个 RabbitMQ 的 ACK 机制我这里再调一下。';
    lastMessages[3] = '[语音] 34"';
    
    unreadCounts[2] = 3;

    if (chatRooms.isNotEmpty) {
      selectRoom(chatRooms.first.id!);
    }
  }

  void selectRoom(int roomId) {
    activeRoomId.value = roomId;
    
    // Clear unread for this room
    unreadCounts[roomId] = 0;

    // Load messages based on room
    if (roomId == 1) {
      currentMessages.assignAll([
        ChatMessageVo(
          id: 101,
          roomId: 1,
          fromUserId: 2,
          fromUserName: 'Alice',
          fromUserAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Alice&backgroundColor=fcd34d',
          content: '大家早上好！今天主要针对 MallChat 的 AI总结功能做测试。',
          createTime: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        ChatMessageVo(
          id: 102,
          roomId: 1,
          fromUserId: 999, // my_id
          fromUserName: 'Me',
          fromUserAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Stephen&backgroundColor=e2e8f0',
          content: '收到，我这边的 RabbitMQ 消息补偿机制已经上线了。',
          createTime: DateTime.now().subtract(const Duration(minutes: 1)),
        )
      ].reversed.toList());
    } else {
      currentMessages.assignAll([
        ChatMessageVo(
          id: 201,
          roomId: roomId,
          fromUserId: roomId + 10,
          fromUserName: 'Other',
          fromUserAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Other&backgroundColor=e2e8f0',
          content: '这是一条历史消息记录...',
          createTime: DateTime.now(),
        )
      ]);
    }
  }

  void markAsRead(int roomId) {
    unreadCounts[roomId] = 0;
  }

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

  void sendMessage(String content) {
    if (content.isEmpty || activeRoomId.value == null) return;

    final roomId = activeRoomId.value!;
    final myMsg = ChatMessageVo(
      id: DateTime.now().millisecondsSinceEpoch,
      roomId: roomId,
      fromUserId: 999, // My ID
      fromUserName: 'Stephen Qiu',
      fromUserAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Stephen&backgroundColor=e2e8f0',
      content: content,
      createTime: DateTime.now(),
    );

    currentMessages.insert(0, myMsg);
    lastMessages[roomId] = content;
    
    // Quick echo logic
    Future.delayed(const Duration(seconds: 1), () {
      final reply = ChatMessageVo(
        id: DateTime.now().millisecondsSinceEpoch,
        roomId: roomId,
        fromUserId: 0, // System
        fromUserName: 'System',
        fromUserAvatar: 'https://api.dicebear.com/7.x/identicon/svg?seed=bot&backgroundColor=2563eb',
        content: '自动回复：已收到指令。',
        createTime: DateTime.now(),
      );
      currentMessages.insert(0, reply);
      lastMessages[roomId] = reply.content!;
    });
  }

  bool isSelf(ChatMessageVo msg) => msg.fromUserId == 999;
}
