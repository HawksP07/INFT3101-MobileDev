import 'dart:convert';
import 'package:flutter/services.dart';

class UserService {
  static Future<List<dynamic>> fetchUsers() async {
    final String response = await rootBundle.loadString('../lib/data/users.json');
    final Map<String, dynamic> data = json.decode(response);
    return data['users'];
  }
}