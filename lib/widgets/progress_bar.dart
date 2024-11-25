import 'package:flutter/material.dart';

class QuizProgressBar extends StatefulWidget {
  final List<String> quizes;

  QuizProgressBar({required this.quizes});

  @override
  _QuizProgressBarState createState() => _QuizProgressBarState();
}

class _QuizProgressBarState extends State<QuizProgressBar> {
  String? selectedTopic;

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                height: 65,
                child: 
                DropdownButton<String>(
                value: selectedTopic,
                hint: Text(widget.quizes[0]),
                isExpanded: true,
                items: widget.quizes.map((String quiz) {
                  return DropdownMenuItem<String>(
                    value: quiz,
                    child: Text(quiz),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTopic = newValue;
                  });
                },
              )
              )
            )
      );
  }
}
