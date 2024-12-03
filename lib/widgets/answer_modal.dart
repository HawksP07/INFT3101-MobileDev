import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/typo.dart';

class FeedbackModal extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onClose;

  const FeedbackModal({
    super.key,
    required this.isCorrect,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isCorrect ? AppColors.green : AppColors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isCorrect ? 'Correct' : 'Incorrect',
              style: AppTypography.quizTextLarge(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isCorrect ? 'Great Job!' : 'Try again!',
              style: AppTypography.textMedium(context).copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: onClose,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
