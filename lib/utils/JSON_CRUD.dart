// ignore_for_file: avoid_print non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

class JsonCrud {

  static Future<File> getFile(String fileName) async {
  final directory = Directory('lib/data');
  if (!(await directory.exists())) { await directory.create(recursive: true); }
  return File('${directory.path}/$fileName');
}

  static Future<Map<String, dynamic>> readJson(String fileName, String jsonTitle) async {
    try {
      final file = await getFile(fileName);
      String contents = await file.readAsString();
      return jsonDecode(contents);
    } catch (e) {
      print("Error reading file: $e");
      return {jsonTitle: []}; 
    }
  }

  static Future<void> writeJson(String fileName, Map<String, dynamic> jsonData) async {
    final file = await getFile(fileName);
    await file.writeAsString(jsonEncode(jsonData), flush: true);
    print("File written to ${file.path}");
  }

  static Future<void> addUser(String fileName, String username, String password, int mcScore, int saScore) async {

        Map<String, dynamic> jsonData = await readJson(fileName, "users");
        List<dynamic> users = jsonData['users'] ?? [];

        users.add({
          "username": username,
          "password": password,
          "multiple-choice-score": mcScore,
          "short-answer-score": saScore,
        });

        jsonData['users'] = users;
        await writeJson(fileName, jsonData);

        print("User Created Sucessfully: $username - $password");
    }
}
