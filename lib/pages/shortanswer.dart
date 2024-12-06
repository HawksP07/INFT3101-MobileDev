// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:inft3101_group12_language_app/utils/JSON_CRUD.dart';
import '../utils/responsive.dart';
import '../widgets/answer_modal.dart';
import '../widgets/body_container.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/btn_end_quiz.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/progress_bar.dart';
import '../widgets/card.dart';
import '../utils/quiz_controller.dart';
import '../widgets/text_field.dart';
import '../widgets/button.dart';
import '../utils/sessionControl.dart'; // Import session control utility

class ShortAnswerPage extends StatefulWidget {
  const ShortAnswerPage({super.key});

  @override
  State<ShortAnswerPage> createState() => _ShortAnswerPageState();
}

class _ShortAnswerPageState extends State<ShortAnswerPage> {
  final QuizController _quizController =
      QuizController(); // Quiz controller to manage state
  final TextEditingController answerController =
      TextEditingController(); // Text controller for user input

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  // Load questions from JSON file
  Future<void> _loadQuestions() async {
    await _quizController.loadQuestions('assets/questions.json', 'short');
    setState(() {}); // Refresh UI after loading questions
  }

  // Check if the user answer matches the correct answer
  bool _checkAnswer(String correctAnswer, String userInput) {
    return correctAnswer.trim().toLowerCase() == userInput.trim().toLowerCase();
  }

  // Show the modal to indicate whether the answer is correct or not
  void _showAnswerModal(bool isCorrect) {
    showDialog(
      context: context,
      builder: (context) => AnswerModal(
        isCorrect: isCorrect,
        onClose: () {
          Navigator.of(context).pop();
          if (isCorrect &&
              _quizController.currentIndex <
                  _quizController.questions.length - 1) {
            setState(() {
              _quizController.goToNext();
              answerController.clear(); // Clear input for the next question
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator if questions are still loading
    if (_quizController.questions.isEmpty) {
      return const Scaffold(
        appBar: CustomAppBar(isLoggedIn: false),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Get the current question
    final currentQuestion =
        _quizController.questions[_quizController.currentIndex];

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
            // Progress Bar
            ProgressBarWidget(
              title: 'Short Answer Quiz',
              current: _quizController.currentIndex + 1,
              total: _quizController.questions.length,
            ),
            const SizedBox(height: 20),
            // Card Widget
            CardWidget(
              question: currentQuestion['question-text'],
              answer: 'Answer Hidden',
              onPrevious: _quizController.currentIndex == 0
                  ? null
                  : () {
                      setState(() {
                        _quizController.goToPrevious();
                        answerController
                            .clear(); // Clear input for previous question
                      });
                    },
              onNext: _quizController.currentIndex ==
                      _quizController.questions.length - 1
                  ? null
                  : () {
                      setState(() {
                        _quizController.goToNext();
                        answerController
                            .clear(); // Clear input for next question
                      });
                    },
            ),
            const SizedBox(height: 20),
            // Answer Text Field
            AnswerTextField(
              controller: answerController,
              hintText: 'Type your answer here',
              onSubmitted: (String userInput) {
                String correctAnswer = currentQuestion['question-answer'];
                if (_checkAnswer(correctAnswer, userInput)) {
                  _showAnswerModal(true);
                } else {
                  _showAnswerModal(false);
                }
              },
            ),
            const SizedBox(height: 20),
            // Submit Button
            CustomButton(
              onPressed: () async {
                String userInput = answerController.text.trim();
                String correctAnswer =
                    currentQuestion['question-answer'].trim();
                if (_checkAnswer(correctAnswer, userInput)) {
                  // Correct answer flow
                  _showAnswerModal(true);

                  // Fetch logged-in username from session
                  String? loggedInUsername = await loadSession();

                  if (loggedInUsername != null) {
                    // Increment the user's score
                    JsonCrud.incrementShortAnswerScore(loggedInUsername);
                  } else {
                    print("No user is logged in.");
                  }

                  setState(() {
                    answerController.clear();
                  });
                } else {
                  // Wrong answer flow
                  _showAnswerModal(false);
                }
              },
              text: 'SUBMIT',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
