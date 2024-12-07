// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inft3101_group12_language_app/theme/color.dart';
import 'package:inft3101_group12_language_app/utils/JSON_CRUD.dart';
import 'package:inft3101_group12_language_app/utils/globals.dart';
import 'package:inft3101_group12_language_app/utils/quiz_controller.dart';
import 'package:inft3101_group12_language_app/utils/responsive.dart';
import 'package:inft3101_group12_language_app/widgets/answer_modal.dart';
import 'package:inft3101_group12_language_app/widgets/body_container.dart';
import 'package:inft3101_group12_language_app/widgets/bottom_nav.dart';
import 'package:inft3101_group12_language_app/widgets/btn_end_quiz.dart';
import 'package:inft3101_group12_language_app/widgets/custom_app_bar.dart';
import 'package:inft3101_group12_language_app/widgets/progress_bar.dart';

class MultipleChoicePage extends StatefulWidget {
  const MultipleChoicePage({super.key});

  @override
  State<MultipleChoicePage> createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  final QuizController _quizController = QuizController();
  List _questions = [];
  var _currentQuestion = 0;
  int _selectedAnswer = -1;

  Future<void> _loadQuestions() async {
    await _quizController.loadQuestions('assets/questions.json', 'multiple');
    setState(() {}); // update
  }

  @override
  void initState() {
    super.initState();
    _loadQuestions();
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

  bool _checkAnswer(int answerVal) {
    int answerNum = 0;
    switch (_currentQuestion) {
      case 0:
        answerNum = 0;
        break;
      case 1:
        answerNum = 2;
        break;
      case 2:
        answerNum = 2;
        break;
      case 3:
        answerNum = 1;
        break;
      case 4:
        answerNum = 2;
        break;
      case 5:
        answerNum = 3;
        break;
      case 6:
        answerNum = 0;
        break;
      case 7:
        answerNum = 2;
        break;
      case 8:
        answerNum = 0;
        break;
      case 9:
        answerNum = 0;
        break;
      default:
        return false;
    }
    if (answerVal == answerNum) {
      return true;
    } else {
      return false;
    }
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
    // print("...All of foo: ${foo[0]['question-text']}");
    List bar = [];
    bar.add(_quizController.questions[_currentQuestion]['question-answer'].toString().split(', '));
    // print("... bar: $bar, current question: $_currentQuestion");
    return Scaffold(
      appBar: const CustomAppBar(isLoggedIn: false),
      body: BodyContainer(
        child: Column(
          children: [
            Padding (
            padding: EdgeInsets.only(
              left: Responsive.widthPercentage(context, 3),
              top:  Responsive.heightPercentage(context, 2),
            ),
            child: const BtnEndQuiz(),
          ),
          ProgressBarWidget(title: 'Multilpe Choice Quiz', current: (_currentQuestion + 1), total: _quizController.questions.length),
            const SizedBox(
              height: 10,
            ),
            Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ), child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 180,
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
                      height: 80,
                      width: 350,
                      child: Center(
                        child: Text(
                        _quizController.questions[_currentQuestion]['question-text'],
                        style: const TextStyle(
                          color: Colors.black, 
                          fontSize: 22,
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
                                _currentQuestion = _currentQuestion - 1;
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
                            // print(foo.length);
                            if (_currentQuestion < _quizController.questions.length - 1) {
                              
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
            height: 10,
          ),
          SizedBox(
            width: 306,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(38)
              ),
              child:  Column(
              children: [
                CheckboxListTile(
                  value: _selectedAnswer == 0 ? true : false,

                  onChanged: (value) => {
                    if(value != null){
                      if(value){
                        setState(() {
                          _selectedAnswer = 0;
                          // print("...Selected answer: ${_selectedAnswer}");
                        })
                      }
                    }
                  },
                  title: Text(
                    bar[0][0]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: const Icon(Icons.volume_up_outlined),
                  visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 306,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(38)
              ),
              child:  Column(
              children: [
                CheckboxListTile(
                  value: _selectedAnswer == 1 ? true : false,

                  onChanged: (value) => {
                    if(value != null){
                      if(value){
                        setState(() {
                          _selectedAnswer = 1;
                          // print("...Selected answer: ${_selectedAnswer}");
                        })
                      }
                    }
                  },
                  title: Text(
                    bar[0][1]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: const Icon(Icons.volume_up_outlined),
                  visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 306,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(38)
              ),
              child:  Column(
              children: [
                CheckboxListTile(
                  value: _selectedAnswer == 2 ? true : false,

                  onChanged: (value) => {
                    if(value != null){
                      if(value){
                        setState(() {
                          _selectedAnswer = 2;
                          // print("...Selected answer: ${_selectedAnswer}");
                        })
                      }
                    }
                  },
                  title: Text(
                    bar[0][2]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: const Icon(Icons.volume_up_outlined),
                  visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 306,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(38)
              ),
              child: Column(
              children: [
                CheckboxListTile(
                  value: _selectedAnswer == 3 ? true : false,

                  onChanged: (value) => {
                    if(value != null){
                      if(value){
                        setState(() {
                          _selectedAnswer = 3;
                          // print("...Selected answer: ${_selectedAnswer}");
                        })
                      }
                    }
                  },
                  title: Text(
                    bar[0][3]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: const Icon(Icons.volume_up_outlined),
                  visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
                  width: 350,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      bool answerCheck = _checkAnswer(_selectedAnswer);
                      if (answerCheck) {
                        _showAnswerModal(true);
                        if (loggedInUsername != null){
                          JsonCrud.incrementShortAnswerScore(loggedInUsername!);
                        } else {
                          print("No user is logged in.");
                        }
                          

                        if (_currentQuestion < _quizController.questions.length - 1) {
                          setState(() {
                            _currentQuestion = _currentQuestion + 1;
                            _selectedAnswer = -1;
                          });
                        }
                        else {
                          // TODO: END OF QUIZ
                          print("This is the end bruh.");
                        }
                      } else {
                        // TODO: WRONG ANSWER
                        print("wrong answer!");
                      }
                    }, 
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 0, 122, 255)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  child: const Text(
                    'CHECK',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(currentIndex: 1));
  }
}
