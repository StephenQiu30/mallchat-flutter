import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mallchat_flutter/api/chat/export.dart';
import 'package:mallchat_flutter/services/api/chat_api.dart';
import 'package:mallchat_flutter/services/api/friend_api.dart';
import 'package:mallchat_flutter/services/service_exception.dart';

/// 按首字母分组的好友数据
class FriendGroup {
  const FriendGroup({required this.letter, required this.friends});
  final String letter;
  final List<ChatFriendUserVo> friends;
}

/// 联系人状态管理 (Provider)
///
/// 管理好友列表、好友申请、按首字母分组等功能
class ContactProvider extends ChangeNotifier {
  static const int _pageSize = 20;

  final FriendApi _friendApi = const FriendApi();
  final ChatApi _chatApi = const ChatApi();

  List<ChatFriendUserVo> _friends = [];
  List<ChatFriendApplyVo> _friendApplies = [];
  bool _contactLoading = false;
  bool _friendApplyLoading = false;
  int _friendApplyPage = 0;
  bool _friendApplyHasMore = false;
  int _friendApplyTotal = 0;
  String _searchQuery = '';

  // --- Getters ---

  List<ChatFriendUserVo> get friends => List.unmodifiable(_friends);
  List<ChatFriendApplyVo> get friendApplies =>
      List.unmodifiable(_friendApplies);
  bool get contactLoading => _contactLoading;
  bool get friendApplyLoading => _friendApplyLoading;
  bool get friendApplyHasMore => _friendApplyHasMore;
  int get friendApplyTotal => _friendApplyTotal;

  /// 按首字母排序的好友列表
  List<ChatFriendUserVo> get sortedFriends {
    final sorted = List<ChatFriendUserVo>.from(_friends);
    sorted.sort((a, b) => (a.userName ?? '').compareTo(b.userName ?? ''));
    return sorted;
  }

  /// 按首字母分组的好友列表
  List<FriendGroup> get groupedFriends {
    final query = _searchQuery.toLowerCase();
    final filtered = query.isEmpty
        ? sortedFriends
        : sortedFriends
            .where(
              (f) => (f.userName ?? '').toLowerCase().contains(query),
            )
            .toList();

    final map = SplayTreeMap<String, List<ChatFriendUserVo>>();
    for (final friend in filtered) {
      final name = friend.userName ?? '';
      final letter = name.isNotEmpty ? _getFirstLetter(name) : '#';
      map.putIfAbsent(letter, () => []).add(friend);
    }

    return map.entries
        .map((e) => FriendGroup(letter: e.key, friends: e.value))
        .toList();
  }

  /// 搜索关键词
  String get searchQuery => _searchQuery;

  /// 待处理的好友申请数量
  int get pendingApplyCount =>
      _friendApplies.where((item) => item.status == 1).length;

  // --- Actions ---

  /// 设置搜索关键词
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// 重置所有状态
  void resetState() {
    _friends = [];
    _friendApplies = [];
    _contactLoading = false;
    _friendApplyLoading = false;
    _friendApplyPage = 0;
    _friendApplyHasMore = false;
    _friendApplyTotal = 0;
    _searchQuery = '';
    notifyListeners();
  }

  /// 刷新好友列表
  Future<void> refreshFriends() async {
    _contactLoading = true;
    notifyListeners();

    try {
      final result = await _friendApi.listFriends();
      _friends = result;
    } on ServiceException catch (e) {
      debugPrint('[ContactProvider] Refresh friends failed: ${e.message}');
    } catch (e) {
      debugPrint('[ContactProvider] Refresh friends failed: $e');
    } finally {
      _contactLoading = false;
      notifyListeners();
    }
  }

  /// 刷新好友申请列表
  Future<void> refreshFriendApplies({bool reset = true}) async {
    if (_friendApplyLoading) return;

    _friendApplyLoading = true;
    notifyListeners();

    try {
      final nextPage = reset ? 1 : _friendApplyPage + 1;
      final result = await _friendApi.listFriendApplies(
        current: nextPage,
        pageSize: _pageSize,
      );
      final records = result.records ?? const <ChatFriendApplyVo>[];
      final nextData = reset
          ? records
          : [..._friendApplies, ..._dedupeApplies(_friendApplies, records)];
      _friendApplies = nextData;
      _friendApplyPage = result.current ?? nextPage;
      _friendApplyTotal = result.total ?? _friendApplies.length;
      final pages = result.pages ?? _friendApplyPage;
      _friendApplyHasMore = _friendApplyPage < pages;
    } on ServiceException catch (e) {
      debugPrint('[ContactProvider] Refresh applies failed: ${e.message}');
    } catch (e) {
      debugPrint('[ContactProvider] Refresh applies failed: $e');
    } finally {
      _friendApplyLoading = false;
      notifyListeners();
    }
  }

  /// 处理好友申请
  Future<void> approveFriendApply(int applyId, int status) async {
    try {
      await _friendApi.approveFriendApply(applyId: applyId, status: status);
      await Future.wait([refreshFriends(), refreshFriendApplies(reset: true)]);
    } on ServiceException catch (e) {
      debugPrint('[ContactProvider] Approve apply failed: ${e.message}');
    } catch (e) {
      debugPrint('[ContactProvider] Approve apply failed: $e');
    }
  }

  /// 发送好友申请
  Future<void> applyFriendByUserId(int userId, String message) async {
    try {
      await _friendApi.applyFriend(userId: userId, message: message);
      await refreshFriendApplies(reset: true);
    } on ServiceException catch (e) {
      debugPrint('[ContactProvider] Apply friend failed: ${e.message}');
    } catch (e) {
      debugPrint('[ContactProvider] Apply friend failed: $e');
    }
  }

  /// 发起私聊并返回 roomId
  Future<int?> startPrivateChat(int userId) async {
    try {
      final roomId = await _chatApi.getOrCreatePrivateRoom(userId);
      return roomId;
    } on ServiceException catch (e) {
      debugPrint('[ContactProvider] Start private chat failed: ${e.message}');
    } catch (e) {
      debugPrint('[ContactProvider] Start private chat failed: $e');
    }
    return null;
  }

  // --- Private Methods ---

  /// 获取中文首字母或英文首字母
  String _getFirstLetter(String name) {
    if (name.isEmpty) return '#';
    final first = name[0].toUpperCase();
    // 英文字母
    if (RegExp(r'^[A-Z]$').hasMatch(first)) return first;
    // 数字
    if (RegExp(r'^[0-9]$').hasMatch(first)) return '#';
    // 中文和其他字符使用拼音首字母（简化处理：使用字符编码范围）
    final code = first.codeUnitAt(0);
    if (code >= 0x4E00 && code <= 0x9FFF) {
      // CJK 统一汉字，使用字符编码排序
      // 简化实现：根据常用姓氏分组
      return _getCjkFirstLetter(first);
    }
    return '#';
  }

  /// 简化的中文首字母提取
  String _getCjkFirstLetter(String char) {
    // 常见姓氏首字母映射（简化版）
    const pinyinMap = {
      'A': '阿安艾爱',
      'B': '白班包宝鲍贝毕边卞薄卜步',
      'C': '蔡曹昌常陈成程池迟褚淳崔',
      'D': '戴但邓狄刁丁董窦杜段',
      'E': '尔',
      'F': '范方费丰封冯凤伏符傅',
      'G': '甘高戈葛耿龚古谷顾关管桂郭国',
      'H': '韩杭郝何贺洪侯胡花华黄霍',
      'J': '姬吉纪季贾简姜江蒋焦金靳晋景鞠',
      'K': '阚康柯孔',
      'L': '赖兰郎乐雷冷黎李连廉梁廖林凌刘柳龙卢鲁路吕罗骆',
      'M': '麻马麦茅梅孟米苗闵莫牟穆',
      'N': '倪年聂牛钮农',
      'O': '欧',
      'P': '潘庞裴彭蒲',
      'Q': '戚齐钱强秦邱曲屈瞿',
      'R': '饶任荣阮',
      'S': '单商邵佘沈盛施石时史舒宋苏孙',
      'T': '谈谭汤唐陶滕田童涂',
      'W': '万汪王韦魏温文翁邬吴伍武',
      'X': '奚夏鲜冼向项萧谢辛邢徐许薛荀',
      'Y': '严言颜杨姚叶殷尤于余袁岳',
      'Z': '臧曾詹张章赵甄郑钟周朱诸祝庄卓宗邹左',
    };

    for (final entry in pinyinMap.entries) {
      if (entry.value.contains(char)) return entry.key;
    }
    return '#';
  }

  List<ChatFriendApplyVo> _dedupeApplies(
    List<ChatFriendApplyVo> existing,
    List<ChatFriendApplyVo> incoming,
  ) {
    final existingIds =
        existing.map((item) => item.id).whereType<int>().toSet();
    return incoming
        .where((item) => item.id == null || !existingIds.contains(item.id))
        .toList();
  }
}
