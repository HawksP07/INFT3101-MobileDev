import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/typo.dart';
import '../utils/responsive.dart';
import 'confirm_end_quiz.dart'; // ConfirmEndQuizDialog import

class BtnEndQuiz extends StatelessWidget {
  const BtnEndQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // Align button to the left of the screen
      child: SizedBox(
        width: Responsive.widthPercentage(context, 30), // Set button width
        height: Responsive.heightPercentage(context, 6), // Set button height
        child: ElevatedButton(
          onPressed: () {
            // Modal dialog widget
            showDialog(
              context: context,
              builder: (context) =>
                  const ConfirmEndQuizDialog(), // Call confirm_end_quiz modal
            );
          },
          // End Quiz button styling
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded button corners
            ),
            backgroundColor: AppColors.primary, // Primary color background
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align content to the start
            children: [
              const Icon(Icons.drive_file_move_outlined, color: Colors.white),
              SizedBox(
                  width: Responsive.widthPercentage(
                      context, 2)), // Space between icon and text
              Text(
                'End Quiz',
                style: AppTypography.buttonTextDark(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
