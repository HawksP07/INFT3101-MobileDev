import 'package:flutter/material.dart';
import '../theme/typo.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed; // Button press action
  final String text; // Button text
  final IconData icon; // Button icon
  final String imagePath; // Background image path

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.imagePath = 'assets/btn-dark.png', // Default image path
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Icon(
                icon,
                color: Colors.white,
                size: 44,
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: AppTypography.mainButtonTextDark(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
