import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveSession(String username) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('loggedInUser', username);
}

Future<String?> loadSession() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('loggedInUser');
}

Future<void> clearSession() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('loggedInUser');
}
