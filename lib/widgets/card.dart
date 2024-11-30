import 'package:flutter/material.dart';
import '../theme/typo.dart';
import '../utils/responsive.dart';
import '../theme/color.dart';

class CardWidget extends StatefulWidget {
  final String question; // The question to display
  final String answer; // The answer to display
  final VoidCallback? onPrevious; // Callback for Previous button
  final VoidCallback? onNext; // Callback for Next button

  const CardWidget({
    super.key,
    required this.question,
    required this.answer,
    this.onPrevious,
    this.onNext,
  });

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _isFlipped = false; // Tracks whether the card is flipped

  void _toggleFlip() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleFlip, // Flip the card on tap
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(Responsive.widthPercentage(context, 3)),
          child: SizedBox(
            height: Responsive.heightPercentage(context, 40),
            width: Responsive.widthPercentage(context, 90),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.volume_up_outlined,
                        size: Responsive.widthPercentage(context, 5),
                        color: AppColors.darkGray),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    _isFlipped
                        ? widget.answer
                        : widget.question, // Show question or answer
                    style: AppTypography.quizTextLarge(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: widget.onPrevious, // Previous button action
                      label: Text(
                        'Previous',
                        style: AppTypography.textMedium(context),
                      ),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.darkGray,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: widget.onNext, // Next button action
                      iconAlignment: IconAlignment.end,
                      label: Text(
                        'Next',
                        style: AppTypography.textMedium(context),
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
