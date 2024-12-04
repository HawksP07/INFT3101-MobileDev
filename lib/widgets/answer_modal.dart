import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/typo.dart';

class AnswerModal extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onClose;

  const AnswerModal({
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
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: onClose,
              ),
            ),
            Text(
              isCorrect ? 'Correct' : 'Incorrect',
              style: AppTypography.answerModalLarge(context),
            ),
            const SizedBox(height: 10),
            Text(
              isCorrect ? 'Great Job!' : 'Try Again!',
              style: AppTypography.answerModalSmall(context),
            ),
          ],
        ),
      ),
    );
  }
}
