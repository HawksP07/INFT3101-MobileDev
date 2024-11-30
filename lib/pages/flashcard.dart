import 'package:flutter/material.dart';
import '../theme/typo.dart';
import '../utils/responsive.dart';
import '../theme/color.dart';

class FlashCardPage extends StatelessWidget {
  const FlashCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '2AIR',
          style: AppTypography.mainTitleDark(context),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: const Icon(Icons.perm_identity, color: AppColors.primary),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings, color: AppColors.primary),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-dark.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Responsive.widthPercentage(context, 5)),
              child: SizedBox(
                width: Responsive.widthPercentage(context, 50),
                height: Responsive.heightPercentage(context, 6),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Are you sure to end the quiz?',
                          style: AppTypography.textMedium(context),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('YES',
                                style: AppTypography.buttonTextDark(context)),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.drive_file_move_outlined,
                          color: Colors.white),
                      SizedBox(width: Responsive.widthPercentage(context, 2)),
                      Text('End Quiz',
                          style: AppTypography.buttonTextDark(context)),
                    ],
                  ),
                ),
              ),
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
