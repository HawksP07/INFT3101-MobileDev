import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inft3101_group12_language_app/theme/color.dart';
import 'package:inft3101_group12_language_app/utils/responsive.dart';
import 'package:inft3101_group12_language_app/widgets/body_container.dart';
import 'package:inft3101_group12_language_app/widgets/bottom_nav.dart';
import 'package:inft3101_group12_language_app/widgets/btn_end_quiz.dart';
import 'package:inft3101_group12_language_app/widgets/custom_app_bar.dart';
import 'package:inft3101_group12_language_app/widgets/progress_bar.dart';

class ShortAnswerPage extends StatefulWidget {

  // It doesnt like being a constant when I put a text controller on it
  const ShortAnswerPage({super.key});

  @override
  State<ShortAnswerPage> createState() => _ShortAnswerPageState();
}

class _ShortAnswerPageState extends State<ShortAnswerPage> {
  List _questions = [];
  var _currentQuestion = 0;
  final TextEditingController answerController = TextEditingController();

  Future<void> fetchQuestions() async {
    final String response = await rootBundle.loadString('questions.json');
    final data = await json.decode(response);
    setState(() {
      _questions = data['questions'];
      print("...number of questions ${_questions.length}");
    });
  }
  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }
  bool _checkAnswer(String answerString, String userInput) {
    if(userInput == answerString){
      return true;
    } else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    List foo = [];
    for (var question in _questions) {
      if (question['type'] == 'short') {
        foo.add(question);
      }
    }

    return Scaffold(
      appBar: CustomAppBar(),
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
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.heightPercentage(context, 2),
              ),
              child: Container(
                height: Responsive.heightPercentage(context, 2),
                width: Responsive.widthPercentage(context, 80),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Stack(
                  children: [
                    Container(
                      width: Responsive.widthPercentage(context, 40),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ), child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 204,
                width: 350,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 329,
                        ),
                        Icon(
                            Icons.volume_up_outlined,
                            size: 21,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 100,
                      width: 350,
                      child: Center(
                        child: Text(
                        foo[_currentQuestion]['question-text'],
                        style: const TextStyle(
                          color: Colors.black, 
                          fontSize: 32,
                        ),
                        textAlign: TextAlign.center
                      ),
                      ) 
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            if (_currentQuestion > 0) {
                              setState(() {
                                _currentQuestion--;
                              });
                            }
                          }, 
                          label: const Text(
                            'Previous',
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ), 
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 115,
                        ),
                        TextButton.icon(
                          onPressed: () { 
                            if (_currentQuestion < foo.length - 1) {
                              setState(() {
                                _currentQuestion++;
                              });
                            }
                          }, 
                          iconAlignment: IconAlignment.end,
                          label: const Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ), 
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350.00,
            child: TextField(
              controller: answerController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 249, 249, 249),
                hintText: 'Type your answer',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
                  width: 350,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      String userInput = answerController.text.toLowerCase().replaceAll(' ', '');
                      String correctResponse = foo[_currentQuestion]['question-answer'].toLowerCase().replaceAll(' ', '');
                      if (_checkAnswer(correctResponse, userInput)) {
                        print('correct answer');
                        setState(() {
                          answerController.text = '';
                          _currentQuestion++;
                        });
                      } else {
                        print('wrong answer, correct one is: ${correctResponse}');
                      }
                    }, 
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 0, 122, 255)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ))
                    ), 
                    child: const Text(
                      'ENTER',  
                      
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
        ],
      )
          ],
        ),
      ),
      
      bottomNavigationBar:const BottomNavBar(currentIndex: 2)
    );
  }
}
