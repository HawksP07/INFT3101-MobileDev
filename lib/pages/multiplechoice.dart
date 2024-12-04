// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inft3101_group12_language_app/utils/responsive.dart';
import 'package:inft3101_group12_language_app/widgets/body_container.dart';
import 'package:inft3101_group12_language_app/widgets/bottom_nav.dart';
import 'package:inft3101_group12_language_app/widgets/btn_end_quiz.dart';
import 'package:inft3101_group12_language_app/widgets/custom_app_bar.dart';
import 'package:inft3101_group12_language_app/widgets/progress_bar.dart';
import '../utils/sessionControl.dart';
import '../utils/JSON_CRUD.dart';

class MultipleChoicePage extends StatefulWidget {
  const MultipleChoicePage({super.key});

  @override
  State<MultipleChoicePage> createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  List _questions = [];
  var _currentQuestion = 0;
  int _selectedAnswer = -1;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final String response = await rootBundle.loadString('questions.json');
    final data = await json.decode(response);
    setState(() {
      _questions = data['questions']
          .where((q) => q['type'] == 'multiple') // Filter multiple-choice
          .toList();
    });
  }

  Future<void> _incrementScore() async {
    // Load session to get the logged-in username
    String? loggedInUsername = await loadSession();
    if (loggedInUsername != null) {
      JsonCrud.incrementMultipleChoiceScore(loggedInUsername);
    } else {
      print("No user is logged in.");
    }
  }

  bool _checkAnswer(int answerVal) {
    final correctAnswer = int.parse(
        _questions[_currentQuestion]['correct-answer']); // Correct answer index
    return answerVal == correctAnswer;
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return const Scaffold(
        appBar: CustomAppBar(isLoggedIn: false),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final question = _questions[_currentQuestion];
    final options = question['question-answer'].toString().split(', ');

    return Scaffold(
      appBar: const CustomAppBar(isLoggedIn: false),
      body: BodyContainer(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Responsive.widthPercentage(context, 3),
                top: Responsive.heightPercentage(context, 2),
              ),
              child: const BtnEndQuiz(),
            ),
            ProgressBarWidget(
              title: 'Multiple Choice Quiz',
              current: _currentQuestion + 1,
              total: _questions.length,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 204,
                  width: 350,
                  child: Column(
                    children: [
                      Text(
                        question['question-text'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      for (int i = 0; i < options.length; i++)
                        CheckboxListTile(
                          value: _selectedAnswer == i,
                          onChanged: (value) {
                            if (value != null && value) {
                              setState(() {
                                _selectedAnswer = i;
                              });
                            }
                          },
                          title: Text(options[i]),
                          controlAffinity: ListTileControlAffinity.leading,
                          secondary: const Icon(Icons.volume_up_outlined),
                          visualDensity: const VisualDensity(
                            horizontal: -2,
                            vertical: -2,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 44,
              child: ElevatedButton(
                onPressed: () async {
                  if (_checkAnswer(_selectedAnswer)) {
                    await _incrementScore(); // Update score for the logged-in user
                    if (_currentQuestion < _questions.length - 1) {
                      setState(() {
                        _currentQuestion++;
                        _selectedAnswer = -1;
                      });
                    } else {
                      // Quiz End
                      print("Quiz Complete!");
                    }
                  } else {
                    print("Wrong answer!");
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 0, 122, 255),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  'CHECK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
