import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../utils/responsive.dart';
import '../widgets/body_container.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/btn_end_quiz.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/progress_bar.dart';
import '../widgets/card.dart';
import '../utils/quiz_controller.dart';

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
    setState(() {}); // 상태 업데이트
  }

  bool _checkAnswer(String correctAnswer, String userInput) {
    return correctAnswer.trim().toLowerCase() == userInput.trim().toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    if (_quizController.questions.isEmpty) {
      return const Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final currentQuestion =
        _quizController.questions[_quizController.currentIndex];

    return Scaffold(
      appBar: const CustomAppBar(),
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
            TextField(
              controller: answerController,
              hintText: 'Type your answer here', // hintText
            ),
            const SizedBox(height: 20),
            // Submit Button
            SizedBox(
              width: Responsive.widthPercentage(context, 80),
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  String userInput = answerController.text.trim();
                  String correctAnswer =
                      currentQuestion['question-answer'].trim();
                  if (_checkAnswer(correctAnswer, userInput)) {
                    // Correct
                    setState(() {
                      answerController.clear();
                      if (_quizController.currentIndex <
                          _quizController.questions.length - 1) {
                        _quizController.goToNext();
                      }
                    });
                  } else {
                    // wrong answer
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Wrong answer! The correct answer is: $correctAnswer',
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColors.primary,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  'SUBMIT',
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
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
