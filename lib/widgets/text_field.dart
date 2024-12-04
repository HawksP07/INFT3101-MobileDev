import 'package:flutter/material.dart';
import '../theme/color.dart';

class AnswerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AnswerTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required Null Function(String userInput) onSubmitted, // hintText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // 80% of width
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white, // Background color set to white
          hintText: hintText, // hintText correctly defined here
          hintStyle: const TextStyle(
            color: AppColors.gray,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(
          color: Colors.black, // Text color set to black
        ),
        onTap: () {
          controller.clear();
        },
      ),
    );
  }
}
