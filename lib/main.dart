import 'package:flutter/material.dart';
import './utils/responsive.dart';
import './widgets/custom_app_bar.dart';
import './widgets/main_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bool isLoggedIn = true; // Mock login status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '3AIR', // Dynamic title passed to CustomAppBar
        isLoggedIn: isLoggedIn,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg-dark.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: Responsive.heightPercentage(context, 15)),
                // Title
                Text(
                  'KOREAN QUIZ',
                  style: Theme.of(context).textTheme.displayLarge, // Use theme
                ),
                SizedBox(height: Responsive.heightPercentage(context, 2)),
                // Subtitle
                SizedBox(
                  width: Responsive.widthPercentage(context, 90),
                  child: Text(
                    'Dive Into Building Your Korean with interactive quizzes',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge, // Use theme
                  ),
                ),
                SizedBox(height: Responsive.heightPercentage(context, 3)),

                // Vocabulary Card Button
                MainButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/flashcard');
                  },
                  text: 'Vocabulary Card',
                  icon: Icons.style_outlined,
                ),

                SizedBox(height: Responsive.heightPercentage(context, 3)),

                // Multiple Choice Button
                MainButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/multiplechoice');
                  },
                  text: 'Multiple Choice',
                  icon: Icons.library_add_check_outlined,
                ),

                SizedBox(height: Responsive.heightPercentage(context, 3)),

                // Short Answer Button
                MainButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/shortanswer');
                  },
                  text: 'Short Answer',
                  icon: Icons.textsms_outlined,
                ),

                const Spacer(),
              ],
            ),
          ),

          // Footer Section
          Positioned(
            bottom: Responsive.heightPercentage(context, 5),
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'INFT 3101 Mobile Development',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge, // Use theme
                ),
                Text(
                  '\u00a9 2024 3AIR',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge, // Use theme
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
