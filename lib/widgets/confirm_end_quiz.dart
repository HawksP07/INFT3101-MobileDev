import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/typo.dart';
import '../utils/responsive.dart';

class ConfirmEndQuizDialog extends StatelessWidget {
  const ConfirmEndQuizDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        'Are you sure to end the quiz?',
        style: AppTypography.textMediumSemiBold(context),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly, // Align buttons properly
      actions: [
        // YES Button
        SizedBox(
          width: Responsive.widthPercentage(context, 20),
          height: Responsive.heightPercentage(context, 6),
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the main screen
              Navigator.pushReplacementNamed(context, '/'); // Redirect to main
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: AppColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'YES',
                  style: AppTypography.buttonTextDark(context),
                ),
              ],
            ),
          ),
        ),
        // NO Button
        SizedBox(
          width: Responsive.widthPercentage(context, 20),
          height: Responsive.heightPercentage(context, 6),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context), // Close dialog on click
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: AppColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NO',
                  style: AppTypography.buttonTextDark(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
