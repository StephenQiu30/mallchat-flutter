import 'package:get/get.dart';
import '../models/chat_room.dart';
import '../models/message.dart';

class ChatController extends GetxController {
  // Chat Rooms List
  var chatRooms = <ChatRoom>[].obs;
  
  // Currently Active Chat Room ID
  var activeRoomId = ''.obs;

  // Messages for active chat room
  var currentMessages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDummyData();
  }

  void _loadDummyData() {
    chatRooms.assignAll([
      ChatRoom(
        id: '1',
        name: 'MallChat 官方交流群',
        avatar: 'https://api.dicebear.com/7.x/identicon/svg?seed=mallchat&backgroundColor=c0aede',
        topMessage: '[图片] 本周架构优化报告已生成。',
        time: '10:42',
        isGroup: true,
      ),
      ChatRoom(
        id: '2',
        name: 'Alice (架构师)',
        avatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Alice&backgroundColor=fcd34d',
        topMessage: '那个 RabbitMQ 的 ACK 机制我这里再调一下。',
        time: '昨天',
        unreadCount: 3,
      ),
      ChatRoom(
        id: '3',
        name: '运维小哥',
        avatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Bob&backgroundColor=a7f3d0',
        topMessage: '[语音] 34"',
        time: '星期二',
      ),
    ]);

    if(chatRooms.isNotEmpty){
      selectRoom(chatRooms.first.id);
    }
  }

  void selectRoom(String roomId) {
    activeRoomId.value = roomId;
    
    // Load messages based on room
    if (roomId == '1') {
      currentMessages.assignAll([
        Message(
          id: 'm1',
          senderId: 'u2',
          senderName: 'Alice',
          senderAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Alice&backgroundColor=fcd34d',
          content: '大家早上好！今天主要针对 MallChat 的 AI总结功能做测试。',
          isSelf: false,
          createTime: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        Message(
          id: 'm2',
          senderId: 'my_id',
          senderName: 'Me',
          senderAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Stephen&backgroundColor=e2e8f0',
          content: '收到，我这边的 RabbitMQ 消息补偿机制已经上线了。',
          isSelf: true,
          createTime: DateTime.now().subtract(const Duration(minutes: 1)),
        )
      ].reversed.toList()); // ListView logic reverse
    } else {
      currentMessages.assignAll([
        Message(
          id: 'test',
          senderId: 'other',
          senderName: 'Other',
          senderAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Other&backgroundColor=e2e8f0',
          content: '这是一条历史消息记录...',
          isSelf: false,
          createTime: DateTime.now(),
        )
      ]);
    }
  }

  void markAsRead(String roomId) {
    var index = chatRooms.indexWhere((r) => r.id == roomId);
    if (index != -1) {
      final old = chatRooms[index];
      chatRooms[index] = ChatRoom(
        id: old.id,
        name: old.name,
        avatar: old.avatar,
        topMessage: old.topMessage,
        time: old.time,
        unreadCount: 0,
        isAi: old.isAi,
        isGroup: old.isGroup,
      );
    }
  }

  void deleteRoom(String roomId) {
    chatRooms.removeWhere((r) => r.id == roomId);
    if(activeRoomId.value == roomId && chatRooms.isNotEmpty) {
      selectRoom(chatRooms.first.id);
    } else if (chatRooms.isEmpty) {
      activeRoomId.value = "";
      currentMessages.clear();
    }
  }

  void sendMessage(String content) {
    if (content.isEmpty || activeRoomId.value.isEmpty) return;

    currentMessages.insert(0, Message(
       id: DateTime.now().millisecondsSinceEpoch.toString(),
       senderId: 'my_id',
       senderName: 'Stephen Qiu',
       senderAvatar: 'https://api.dicebear.com/7.x/notionists/svg?seed=Stephen&backgroundColor=e2e8f0',
       content: content,
       isSelf: true,
       createTime: DateTime.now(),
    ));
    
    // Quick echo logic for QQ simulation
    Future.delayed(const Duration(seconds: 1), () {
       currentMessages.insert(0, Message(
         id: '${DateTime.now().millisecondsSinceEpoch}r',
         senderId: 'system',
         senderName: 'System',
         senderAvatar: 'https://api.dicebear.com/7.x/identicon/svg?seed=bot&backgroundColor=2563eb',
         content: '自动回复：已收到指令。',
         isSelf: false,
         createTime: DateTime.now(),
       ));
    });
  }
}
