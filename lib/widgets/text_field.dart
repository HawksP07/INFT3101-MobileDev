import 'package:flutter/material.dart';

class AnswerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AnswerTextField({
    super.key,
    required this.controller,
    required this.hintText, // hintText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // 80% of width
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 249, 249, 249),
          hintText: hintText, //
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 196, 196, 196),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
