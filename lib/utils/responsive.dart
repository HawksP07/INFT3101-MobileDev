import 'package:flutter/material.dart';

class Responsive {
  // calculate rem: Using 1% of the screen width as rem
  static double rem(BuildContext context) {
    return MediaQuery.of(context).size.width / 100;
  }

  // Calculate width percentage
  static double widthPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  // Calculate height percentage
  static double heightPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  // Calculate aspect ratio based size
  static double aspectRatioBasedSize(BuildContext context, double baseSize) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return baseSize * aspectRatio;
  }
}
