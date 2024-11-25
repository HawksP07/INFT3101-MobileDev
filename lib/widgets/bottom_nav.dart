import 'package:flutter/material.dart';
import 'package:inft3101_group12_language_app/pages/login.dart';
import 'package:inft3101_group12_language_app/pages/flashcard.dart';
import 'package:inft3101_group12_language_app/pages/multiplechoice.dart';
import 'package:inft3101_group12_language_app/pages/settings.dart';
import 'package:inft3101_group12_language_app/pages/shortanswer.dart';
import 'package:inft3101_group12_language_app/pages/signup.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) { // This does not work, issue with navigation
          switch (currentIndex) {
            case 0:
              Navigator.pushNamed(context, '/flashcard');
              break;
            case 1:
              Navigator.pushNamed(context, '/multiplechoice');
              break;
            case 2:
              Navigator.pushNamed(context, '/shortanswer');
              break;
            default:
            break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.style_outlined), label: 'Vocabulary',),
          BottomNavigationBarItem(icon: Icon(Icons.library_add_check_outlined), label: 'MC Quiz',),
          BottomNavigationBarItem(icon: Icon(Icons.textsms_outlined), label: 'SA Quiz',)
        ],
      );
  }
}