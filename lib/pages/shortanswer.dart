import 'package:flutter/material.dart';
import '../utils/globals.dart';
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

class ShortAnswerPage extends StatefulWidget {
  const ShortAnswerPage({super.key});

  @override
  State<ShortAnswerPage> createState() => _ShortAnswerPageState();
}

class _ShortAnswerPageState extends State<ShortAnswerPage> {
  final QuizController _quizController = QuizController();
  final TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    await _quizController.loadQuestions('assets/questions.json', 'short');
    setState(() {}); // update
  }

  bool _checkAnswer(String correctAnswer, String userInput) {
    return correctAnswer.trim().toLowerCase() == userInput.trim().toLowerCase();
  }

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
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_quizController.questions.isEmpty) {
      return const Scaffold(
        appBar: CustomAppBar(isLoggedIn: false),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
              answer: 'Answer Hidden', //
              onPrevious: _quizController.currentIndex == 0
                  ? null
                  : () {
                      setState(() {
                        _quizController.goToPrevious();
                      });
                    },
              onNext: _quizController.currentIndex ==
                      _quizController.questions.length - 1
                  ? null
                  : () {
                      setState(() {
                        _quizController.goToNext();
                      });
                    },
            ),
            const SizedBox(height: 20),
            // Answer Text Field
            AnswerTextField(
              controller: answerController,
              hintText: 'Type your answer here',
              // onSubmitted: (String userInput) {}, //TODO this was broken idk why
            ),
            const SizedBox(height: 20),
            // Submit Button
            CustomButton(
              onPressed: () {
                String userInput = answerController.text.trim();
                String correctAnswer =
                    currentQuestion['question-answer'].trim();
                if (_checkAnswer(correctAnswer, userInput)) {
                  // Correct
                  _showAnswerModal(true);

                  //somehow fetch users here

                  if (loggedInUsername != null) {
                    JsonCrud.incrementShortAnswerScore(loggedInUsername!);
                  } else {
                    print("No user is logged in.");
                  }

                  setState(() {
                    answerController.clear();
                  });
                } else {
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
