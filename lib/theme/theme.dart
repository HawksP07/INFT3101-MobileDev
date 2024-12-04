import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/typo.dart';

// Dark Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.darkBackground,
  textTheme: TextTheme(
    displayLarge: AppTypography.staticMainTitleDark,
    bodyLarge: AppTypography.staticMainDescriptionDark,
    labelLarge: AppTypography.staticButtonTextDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: AppTypography.staticButtonTextDark, // Static text style
    ),
  ),
);

// Light Theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.lightGray,
  textTheme: TextTheme(
    displayLarge: AppTypography.staticLogo,
    bodyLarge: AppTypography.staticTextMedium,
    labelLarge: AppTypography.staticButtonTextLargeDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: AppTypography.staticButtonTextDark, // Static text style
    ),
  ),
);
