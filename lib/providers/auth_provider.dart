import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mallchat_flutter/api/user/models/login_user_vo.dart';
import 'package:mallchat_flutter/services/api/user_api.dart';
import 'package:mallchat_flutter/services/service_exception.dart';

/// 认证状态管理 (Provider)
///
/// 管理用户登录状态、用户信息持久化和认证流程
class AuthProvider extends ChangeNotifier {
  final UserApi _userApi = const UserApi();
  final SharedPreferences _prefs;

  AuthProvider(this._prefs) {
    _restoreSession();
  }

  LoginUserVo? _userProfile;
  bool _isLoggedIn = false;
  bool _isInitialized = false;
  bool _isBootstrapping = false;

  // --- Getters ---

  LoginUserVo? get userProfile => _userProfile;
  bool get isLoggedIn => _isLoggedIn;
  bool get isInitialized => _isInitialized;
  bool get isBootstrapping => _isBootstrapping;
  String? get token => _prefs.getString('token');

  // --- Actions ---

  /// 邮箱验证码登录
  Future<void> loginByEmail({
    required String email,
    required String code,
  }) async {
    final loginUser = await _userApi.loginByEmail(email: email, code: code);
    _saveLoginInfo(loginUser);
  }

  /// 微信登录
  Future<void> loginByWechat(String code) async {
    final loginUser = await _userApi.loginByWechat(code);
    _saveLoginInfo(loginUser);
  }

  /// 刷新用户资料
  Future<void> refreshUserProfile() async {
    if (!_isLoggedIn) return;

    try {
      final profile = await _userApi.getLoginUser();
      _saveLoginInfo(profile);
    } on ServiceException catch (e) {
      debugPrint('[AuthProvider] Profile refresh failed: ${e.message}');
      if (e.message.contains('401') || e.message.contains('登录')) {
        logoutLocal();
      }
    } catch (e) {
      debugPrint('[AuthProvider] Profile refresh failed: $e');
    }
  }

  /// 远程退出登录
  Future<void> logoutRemote() async {
    try {
      await _userApi.logout();
    } catch (e) {
      debugPrint('[AuthProvider] Remote logout failed: $e');
    } finally {
      logoutLocal();
    }
  }

  /// 本地退出登录（清除本地状态）
  void logoutLocal() {
    _prefs.remove('token');
    _prefs.remove('user_profile');
    _userProfile = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  /// 保存登录信息
  void _saveLoginInfo(LoginUserVo vo) {
    final mergedProfile = _mergeProfile(vo);
    _userProfile = mergedProfile;

    final nextToken = mergedProfile.token;
    if (nextToken != null && nextToken.isNotEmpty) {
      _prefs.setString('token', nextToken);
    }
    _prefs.setString('user_profile', jsonEncode(mergedProfile.toJson()));
    _isLoggedIn = true;
    notifyListeners();
  }

  /// 恢复本地会话
  void _restoreSession() {
    final savedToken = _prefs.getString('token');
    final savedProfile = _prefs.getString('user_profile');

    if (savedToken != null && savedToken.isNotEmpty) {
      _isLoggedIn = true;
      if (savedProfile != null) {
        try {
          _userProfile =
              LoginUserVo.fromJson(jsonDecode(savedProfile) as Map<String, dynamic>);
        } catch (e) {
          logoutLocal();
        }
      }
    }
    _isInitialized = true;
    notifyListeners();
  }

  /// 合并用户资料（避免丢失本地已有字段）
  LoginUserVo _mergeProfile(LoginUserVo incoming) {
    final current = _userProfile;
    if (current == null) return incoming;

    return LoginUserVo(
      id: incoming.id ?? current.id,
      userName: incoming.userName ?? current.userName,
      userAvatar: incoming.userAvatar ?? current.userAvatar,
      userRole: incoming.userRole ?? current.userRole,
      userProfile: incoming.userProfile ?? current.userProfile,
      userPhone: incoming.userPhone ?? current.userPhone,
      userEmail: incoming.userEmail ?? current.userEmail,
      lastLoginTime: incoming.lastLoginTime ?? current.lastLoginTime,
      createTime: incoming.createTime ?? current.createTime,
      updateTime: incoming.updateTime ?? current.updateTime,
      token: incoming.token ?? current.token ?? token,
    );
  }
}
