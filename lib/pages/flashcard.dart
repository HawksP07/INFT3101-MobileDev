import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/body_container.dart';
import '../widgets/btn_end_quiz.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/card.dart';
import '../widgets/progress_bar.dart';
import '../utils/quiz_controller.dart';

class FlashCardPage extends StatefulWidget {
  const FlashCardPage({super.key});

  @override
  FlashCardPageState createState() => FlashCardPageState();
}

class FlashCardPageState extends State<FlashCardPage> {
  final QuizController _quizController = QuizController();

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    await _quizController.loadQuestions('assets/questions.json', 'flash');
    setState(() {}); // State update
  }

  @override
  Widget build(BuildContext context) {
    if (_quizController.questions.isEmpty) {
      // Loading
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
      appBar: const CustomAppBar(), // CustomAppBar widget
      body: BodyContainer(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Responsive.widthPercentage(context, 3), // padding left
                top: Responsive.heightPercentage(context, 2),
              ),
              child: const BtnEndQuiz(),
            ),
            // Progress Bar
            ProgressBarWidget(
              title: 'Vocabulary Level 1', // Dynamic title
              current: _quizController.currentIndex +
                  1, // Current question index (1-based)
              total:
                  _quizController.questions.length, // Total number of questions
            ),
            const SizedBox(height: 20),
            CardWidget(
              question: currentQuestion['question-text'], // Display question
              answer: currentQuestion['question-answer'], // Display answer
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
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(currentIndex: 0), // BottomNavBar widget
    );
  }
}
