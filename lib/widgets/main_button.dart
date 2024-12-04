import 'package:flutter/material.dart';
import '../theme/typo.dart';
import '../theme/color.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed; // Button press action
  final String text; // Button text
  final IconData icon; // Button icon
  final String imagePath; // Background image path
  final bool isSquare; // Square button mode (for landscape)

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.imagePath = 'assets/btn-dark.png', // Default image path
    this.isSquare = false, // Default to non-square
  });

  @override
  Widget build(BuildContext context) {
    // Determine width and height based on orientation
    final width = isSquare
        ? MediaQuery.of(context).size.width * 0.25 // Square button width
        : MediaQuery.of(context).size.width * 0.8; // Regular button width
    final height = isSquare
        ? width // Square height matches width
        : MediaQuery.of(context).size.height * 0.12; // Portrait mode height

    return MouseRegion(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover, // Cover button dimensions
              ),
            ),
            child: isSquare
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: Colors.white, size: width * 0.4),
                      SizedBox(height: width * 0.1),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style:
                            AppTypography.mainButtonTextDark(context).copyWith(
                          fontSize: width * 0.12, // Dynamically scale font size
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: Colors.white, size: 44),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Text(
                          text,
                          style: AppTypography.mainButtonTextDark(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
