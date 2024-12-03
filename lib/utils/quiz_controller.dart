import 'dart:convert';
import 'package:flutter/services.dart';

class QuizController {
  List<dynamic> questions = [];
  int currentIndex = 0;

  // Load questions from JSON file
  Future<void> loadQuestions(String path, String type) async {
    try {
      final String jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      questions = jsonData['questions']
          .where((question) => question['type'] == type)
          .toList();
    } catch (e) {
      print("Error loading questions: $e");
    }
  }

  // Navigate to the previous question
  void goToPrevious() {
    if (currentIndex > 0) {
      currentIndex--;
    }
  }

  // Navigate to the next question
  void goToNext() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
    }
  }
}
