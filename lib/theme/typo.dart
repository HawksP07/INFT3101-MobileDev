import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive.dart';
import './color.dart';

class AppTypography {
  // Basic style with custom fontSize and color
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

  // Dark mode main title
  static TextStyle logo(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4.5,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGray,
    );
  }

  // Dark mode main title
  static TextStyle mainTitleDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 7,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  // Dark mode main description
  static TextStyle mainDescriptionDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3.5,
      fontWeight: FontWeight.w400,
      color: AppColors.lightGray,
    );
  }

  // Dark mode main button text
  static TextStyle mainButtonTextDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4.3,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  // Dark mode main button text large
  static TextStyle buttonTextLargeDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  // Dark mode main button text
  static TextStyle buttonTextDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  // Dark mode copywrite text style
  static TextStyle copywriteDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 2.5,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );
  }

  // quiz text large
  static TextStyle quizTextLarge(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 6,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGray,
    );
  }

  // quiz text medium
  static TextStyle textMedium(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGray,
    );
  }

  // quiz text medium
  static TextStyle textMediumSemiBold(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGray,
    );
  }

  // quiz text small
  static TextStyle textSmall(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 6,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGray,
    );
  }

  // progress title
  static TextStyle progressTitle(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGray,
    );
  }

  // progress total text
  static TextStyle progressTotal(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 2,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGray,
    );
  }

  // progress current quiz text
  static TextStyle progressCurrent(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 2,
      fontWeight: FontWeight.w300,
      color: AppColors.primary,
    );
  }

  // answer modal large
  static TextStyle answerModalLarge(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 8,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  // answer modal small
  static TextStyle answerModalSmall(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  // Static TextStyles for ThemeData
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
    color: AppColors.darkGray,
  );

  static final TextStyle staticTextMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.darkGray,
  );
}
