import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/typo.dart';

class ProgressBarWidget extends StatelessWidget {
  final String title;
  final int current;
  final int total;
  final Color backgroundColor;
  final Color progressColor;

  const ProgressBarWidget({
    super.key,
    required this.title,
    required this.current,
    required this.total,
    this.backgroundColor = AppColors.lightGray,
    this.progressColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final progress = current / total; //

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.progressTitle(context),
              ),
              Row(
                children: [
                  Text(
                    '$current',
                    style: AppTypography.progressCurrent(context),
                  ),
                  Text(
                    '/$total',
                    style: AppTypography.progressTotal(context),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: backgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
