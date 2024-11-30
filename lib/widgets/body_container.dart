import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final AlignmentGeometry alignment;

  const BodyContainer({
    super.key,
    required this.child,
    this.backgroundImage = 'assets/bg-dark.jpg',
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
