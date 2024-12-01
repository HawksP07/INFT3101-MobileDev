import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int? currentIndex;

  const BottomNavBar({
    super.key,
    this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    print("selected: ${currentIndex}");
    return BottomNavigationBar(
        currentIndex: currentIndex ?? 0,
        selectedItemColor: currentIndex == null ? Colors.grey : Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) { // This does not work, issue with navigation
          switch (index) {
            case 0:
              // Navigator.pushNamed(context, '/flashcard');
              Navigator.pushNamedAndRemoveUntil(context, '/flashcard', ModalRoute.withName('/'));
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(context, '/multiplechoice', ModalRoute.withName('/'));
              break;
            case 2:
              Navigator.pushNamedAndRemoveUntil(context, '/shortanswer', ModalRoute.withName('/'));
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