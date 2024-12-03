import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive.dart';
import './color.dart';

class AppTypography {
  // Base style method for consistent typography
  static TextStyle _base({
    required BuildContext context,
    required double fontSizeRem,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.white,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSizeRem * Responsive.rem(context),
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Logo style
  static TextStyle logo(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4.5,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGray,
    );
  }

  // Main title in dark mode
  static TextStyle mainTitleDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 7,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  // Description in dark mode
  static TextStyle mainDescriptionDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3.5,
      fontWeight: FontWeight.w400,
      color: AppColors.lightGray,
    );
  }

  // Button text style for dark mode
  static TextStyle mainButtonTextDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 5,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  // Large button text style in dark mode
  static TextStyle buttonTextLargeDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  // Standard button text style in dark mode
  static TextStyle buttonTextDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  // Copywrite text style for dark mode
  static TextStyle copywriteDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 2.5,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );
  }

  // Quiz text large
  static TextStyle quizTextLarge(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 6,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGray,
    );
  }

  // Medium-sized quiz text
  static TextStyle textMedium(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGray,
    );
  }

  // Medium bold quiz text
  static TextStyle textMediumSemiBold(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGray,
    );
  }

  // Small quiz text
  static TextStyle textSmall(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 6,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGray,
    );
  }

  // Progress title text
  static TextStyle progressTitle(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGray,
    );
  }

  // Total progress text
  static TextStyle progressTotal(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 2,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGray,
    );
  }

  // Current progress text
  static TextStyle progressCurrent(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 2,
      fontWeight: FontWeight.w300,
      color: AppColors.primary,
    );
  }

  // Answer modal large text
  static TextStyle answerModalLarge(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 8,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  // Answer modal small text
  static TextStyle answerModalSmall(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  // Static TextStyles for ThemeData integration
  static final TextStyle staticMainTitleDark = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle staticMainDescriptionDark = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGray,
  );

  static final TextStyle staticButtonTextDark = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final TextStyle staticButtonTextLargeDark = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final TextStyle staticLogo = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final TextStyle staticCopywrite = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
}
