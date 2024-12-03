import 'package:flutter/foundation.dart';

class UserState with ChangeNotifier {
  String? _username;

  String? get username => _username;

  void login(String username) {
    _username = username;
    notifyListeners();
  }

  void logout() {
    _username = null;
    notifyListeners();
  }
}
