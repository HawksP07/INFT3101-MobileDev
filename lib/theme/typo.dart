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

  // Main title style
  static TextStyle mainTitleDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 6, // 4.5 rem
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  // Description style
  static TextStyle mainDescriptionDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 3.5, // 2.4 rem
      fontWeight: FontWeight.w400,
      color: AppColors.lightGray,
    );
  }

  // Button text style
  static TextStyle buttonTextDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 4.3,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  // Copywrite text style
  static TextStyle copywriteDark(BuildContext context) {
    return _base(
      context: context,
      fontSizeRem: 2.5,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );
  }
}
