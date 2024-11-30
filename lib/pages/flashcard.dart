import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../theme/color.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/body_container.dart';
import '../widgets/btn_end_quiz.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/card.dart';

class FlashCardPage extends StatefulWidget {
  const FlashCardPage({super.key});

  @override
  _FlashCardPageState createState() => _FlashCardPageState();
}

class _FlashCardPageState extends State<FlashCardPage> {
  List<dynamic> _questions = []; // Holds the parsed questions
  int _currentIndex = 0; // Tracks the current question index

  @override
  void initState() {
    super.initState();
    _loadQuestions(); // Load questions on initialization
  }

  Future<void> _loadQuestions() async {
    try {
      // Load and decode JSON data
      final String jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/questions.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      setState(() {
        _questions = jsonData['questions']; // Assign parsed questions
      });
    } catch (e) {
      debugPrint("Error loading questions: $e");
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _goToNext() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      // Show loading indicator while questions are being loaded
      return const Scaffold(
        appBar: CustomAppBar(title: '2AIR'),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final currentQuestion = _questions[_currentIndex];

    return Scaffold(
      appBar: const CustomAppBar(title: '2AIR'), // CustomAppBar widget
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
            // Progress Bar Placeholder
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.heightPercentage(context, 2),
              ),
              child: Container(
                height: Responsive.heightPercentage(context, 2),
                width: Responsive.widthPercentage(context, 80),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: Responsive.widthPercentage(context, 40), // 50%
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CardWidget(
              question: currentQuestion['question-text'], // Display question
              answer: currentQuestion['question-answer'], // Display answer
              onPrevious: _goToPrevious, // Navigate to previous question
              onNext: _goToNext, // Navigate to next question
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(currentIndex: 0), // BottomNavBar widget
    );
  }
}
