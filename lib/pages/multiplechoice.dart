import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inft3101_group12_language_app/widgets/bottom_nav.dart';
import 'package:inft3101_group12_language_app/widgets/progress_bar.dart';

class MultipleChoicePage extends StatefulWidget {
  const MultipleChoicePage({super.key});

  @override
  State<MultipleChoicePage> createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  List _questions = [];
  List _mcQuestions = [];
  var _currentQuestion = 0;

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
    // List foo = [];
    // for (var question in _questions) {
    //   if (question['type'] == 'multiple') {
    //     foo.add(question);
    //   }
    // }
    // setState(() {
    //   _mcQuestions = foo;
    // });
   }
   

  @override
  Widget build(BuildContext context) {
    List foo = [];
    for (var question in _questions) {
      if (question['type'] == 'multiple') {
        foo.add(question);
        // print("...flash question: ${question}");
      }
    }
    // print("...All of foo: ${foo[0]['question-text']}");
    List bar = [];
    bar.add(foo[_currentQuestion]['question-answer'].toString().split(', '));
    print("... bar: ${bar}, current question: ${_currentQuestion}");
    final quizes = [
      'Q1: What is the Korean word for "Hello"?',
      'Q2: What is the Korean word for "Hello"? ',
      'Q3: What is the Korean word for "Hello"? ',
      'Q4: What is the Korean word for "Hello"? ',
      'Q5: What is the Korean word for "Hello"?',
      'Q6: What is the Korean word for "Hello"? ',
      'Q7: What is the Korean word for "Hello"?',
      'Q8: What is the Korean word for "Hello"?',
      'Q9: What is the Korean word for "Hello"?',
      'Q10: What is the Korean word for "Hello"?',
      'Q11: What is the Korean word for "Hello"?',
    ];
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          '2AIR',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),
        actions: [
          IconButton(onPressed: () {Navigator.pushNamed(context, '/login');}, icon: Icon(Icons.perm_identity)),
          IconButton(onPressed: () {Navigator.pushNamed(context, '/settings');}, icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-dark.jpg'),
            fit: BoxFit.cover
          )
        ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(28),
                child:
                SizedBox(
              width: 160,
              height: 44,
              child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Stack(fit: StackFit.expand, children: [
                    Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/btn-dark.png'),
                              fit: BoxFit.cover)),
                    ),
                    const Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(width: 20),
                          Icon(
                            Icons.drive_file_move_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text('End Quiz',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))
                        ])
                  ])),
                ),
              )
            ],
          ),
          QuizProgressBar(quizes: quizes),
          const SizedBox(
            height: 20
          ),
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
                        foo[_currentQuestion]['question-text'], //TODO
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
                            print(foo.length);
                            if (_currentQuestion < foo.length - 1) {
                              
                              setState(() {
                                _currentQuestion = _currentQuestion + 1;
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
            width: 306,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(38)
              ),
              child:  Column(
              children: [
                CheckboxListTile(
                  value: false,
                  onChanged: null,
                  title: Text(
                    bar[0][0]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  secondary: Icon(Icons.volume_up_outlined),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
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
                  value: false,
                  onChanged: null,
                  title: Text(
                    bar[0][1]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  secondary: Icon(Icons.volume_up_outlined),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
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
                  value: false,
                  onChanged: null,
                  title: Text(
                    bar[0][2]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  secondary: Icon(Icons.volume_up_outlined),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
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
                  value: false,
                  onChanged: null,
                  title: Text(
                    bar[0][3]
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  secondary: Icon(Icons.volume_up_outlined),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
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
                      Navigator.pushNamed(context, '/signup');
                    }, 
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 122, 255)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ))
                    ), 
                    child: const Text(
                      'CHECK',  
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
      ),
      bottomNavigationBar:const BottomNavBar(currentIndex: 1)
    );
  }
}
