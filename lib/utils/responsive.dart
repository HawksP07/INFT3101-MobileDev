import 'package:flutter/material.dart';

class Responsive {
  // calculate rem: Using 1% of the screen width as rem
  static double rem(BuildContext context) {
    return MediaQuery.of(context).size.width / 100;
  }
}
