// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:io'; // For file operations
import 'package:inft3101_group12_language_app/pages/login.dart';
import 'package:path/path.dart' as path; // For handling paths

class JsonCrud {
  static const String _fileName = 'users.json';

  // Get the correct directory for file storage on Windows
  static Future<String> _getFilePath() async {
    const directory = "lib/data";
    return path.join(Directory.current.path, directory, _fileName);
  }

  // Read user data
  static Future<Map<String, dynamic>> readJson() async {
    try {
      final path = await _getFilePath();
      final file = File(path);
      if (!(await file.exists())) {
        return {"users": []}; // Return empty if file does not exist
      }
      String jsonString = await file.readAsString();
      return jsonDecode(jsonString);
    } catch (e) {
      print("Error reading JSON: $e");
      return {"users": []}; // Return empty on error
    }
  }

  // Write user data
  static Future<void> writeJson(Map<String, dynamic> jsonData) async {
    try {
      // For desktop platforms, write to file
      final path = await _getFilePath();
      final file = File(path);
      await file.create(recursive: true); // Ensure directory exists
      await file.writeAsString(jsonEncode(jsonData), flush: true);
      print("Data written to $path");
    } catch (e) {
      print("Error writing JSON: $e");
    }
  }

  // Add a user
  static Future<void> addUser(
      String username, String password, int mcScore, int saScore) async {
    try {
      Map<String, dynamic> jsonData = await readJson();
      List<dynamic> users = jsonData['users'] ?? [];

      // Add the new user
      users.add({
        "username": username,
        "password": password,
        "multiple_choice_score": mcScore,
        "short_answer_score": saScore,
      });

      jsonData['users'] = users;
      await writeJson(jsonData);

      print("User Created Successfully: $username");
      users = await UserService.fetchUsers();
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  static Future<void> incrementShortAnswerScore(String username) async {
    try {
      // Read the JSON data
      Map<String, dynamic> jsonData = await readJson();
      List<dynamic> users = jsonData['users'] ?? [];

      // Find the user and update the score
      for (var user in users) {
        if (user['username'] == username) {
          user['short_answer_score'] = (user['short_answer_score'] ?? 0) + 10;
          break; // Stop once the user is found
        }
      }

      // Write the updated data back to the file
      jsonData['users'] = users;
      await writeJson(jsonData);

      print("Incremented short_answer_score for user: $username");
    } catch (e) {
      print("Error incrementing score: $e");
    }
  }
}
