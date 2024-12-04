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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // 가로 80%
      height: MediaQuery.of(context).size.height * 0.1, // 세로 10%
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Ink(
            width: MediaQuery.of(context).size.width * 0.8, // Ink 가로 크기
            height: MediaQuery.of(context).size.height * 0.1, // Ink 세로 크기
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover, // 버튼 크기에 이미지를 덮어 씌움
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 44,
                ),
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
