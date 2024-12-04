import 'package:flutter/foundation.dart';

class UserState with ChangeNotifier {
  String? _username;

  // Getter for the username
  String? get username => _username;

  // Getter to check if the user is logged in
  bool get isLoggedIn => _username != null;

  // Method to log in the user
  void login(String username) {
    _username = username;
    notifyListeners(); // Notify listeners about the state change
  }

  // Method to log out the user
  void logout() {
    _username = null;
    notifyListeners(); // Notify listeners about the state change
  }
}
