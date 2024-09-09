import 'package:flutter/material.dart';
import 'user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;

  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  // Setter for user object
  void setUser(User user) {
    _user = user;
    _isLoggedIn = true;
    notifyListeners();
  }

  // Setter for userKey (userKey를 String으로 처리)
  void setUserID(String userId) {
    if (_user != null) {
      _user = User(
        userId,  // int.parse() 제거, 바로 userId 사용
        _user!.user_nickname,
      );
    } else {
      _user = User(
        userId,  // int.parse() 제거, 바로 userId 사용
        'New User',  // 기본 닉네임 설정
      );
    }
    _isLoggedIn = true;
    notifyListeners();
  }

  // 닉네임 업데이트
  void updateUserNickname(String newNickname) {
    if (_user != null) {
      _user = User(
        _user!.userKey,
        newNickname,
      );
      notifyListeners();
    }
  }

  // 로그아웃
  void logOut() {
    _isLoggedIn = false;
    _user = null;
    notifyListeners();
  }
}
