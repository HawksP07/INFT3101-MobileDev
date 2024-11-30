import 'package:flutter/material.dart';
import '../theme/typo.dart';
import '../utils/responsive.dart';
import '../theme/color.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/body_container.dart';
import '../widgets/btn_end_quiz.dart';

class FlashCardPage extends StatelessWidget {
  const FlashCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: '2AIR'), // CustomAppBar widget
      body: BodyContainer(
        // body container widget
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Responsive.widthPercentage(context, 3), // padding left
                top: Responsive.heightPercentage(context, 2),
              ),
              child: const BtnEndQuiz(),
            ),
            // Progress Bar Placeholder
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.heightPercentage(context, 2),
              ),
              child: Container(
                height: Responsive.heightPercentage(context, 2),
                width: Responsive.widthPercentage(context, 80),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: Responsive.widthPercentage(context, 40), // 50%
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(Responsive.widthPercentage(context, 3)),
                child: SizedBox(
                  height: Responsive.heightPercentage(context, 40),
                  width: Responsive.widthPercentage(context, 90),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.volume_up_outlined,
                              size: Responsive.widthPercentage(context, 5),
                              color: AppColors.darkGray),
                        ],
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          'The term used to identify a person',
                          style: AppTypography.quizTextLarge(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: null,
                            label: Text(
                              'Previous',
                              style: AppTypography.textMedium(context),
                            ),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColors.gray,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: null,
                            iconAlignment: IconAlignment.end,
                            label: Text(
                              'Next',
                              style: AppTypography.textMedium(context),
                            ),
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
