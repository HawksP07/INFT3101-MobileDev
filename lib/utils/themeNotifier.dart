// ignore: file_names
import 'package:flutter/material.dart';
import '../theme/color.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = true;
  Color _backgroundColor = AppColors.darkBackground;

  bool get isDarkMode => _isDarkMode;
  Color get backgroundColor => _backgroundColor;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;

    _backgroundColor =
        _isDarkMode ? AppColors.darkBackground : AppColors.lightGray;

    notifyListeners();
  }

  void updateBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners(); // 상태 변경 알림
  }
}
