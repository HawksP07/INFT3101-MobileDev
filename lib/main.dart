import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/flashcard.dart';
import 'pages/login.dart';
import 'pages/settings.dart';
import 'pages/signup.dart';
import './widgets/custom_app_bar.dart';
import './utils/responsive.dart';
import './widgets/main_button.dart';
import 'pages/multiplechoice.dart';
import 'pages/shortanswer.dart';
import 'utils/user_state.dart';
import './theme/theme.dart';
import './theme/typo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // Track the theme mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? darkTheme : lightTheme, // Use dynamic theme
      home: const MyHomePage(title: '2AIR'),
      routes: {
        '/login': (context) => const LoginPage(),
        '/settings': (context) => SettingsPage(
              onThemeToggle: (isDark) {
                setState(() {
                  _isDarkMode = isDark; // Update theme mode
                });
              },
            ),
        '/signup': (context) => const SignupPage(),
        '/flashcard': (context) => const FlashCardPage(),
        '/multiplechoice': (context) => const MultipleChoicePage(),
        '/shortanswer': (context) => const ShortAnswerPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Provider.of<UserState>(context).isLoggedIn;

    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        isLoggedIn: isLoggedIn,
      ),
      body: Stack(
        children: [
          // Background Container covering the whole screen
          Container(
            width: double.infinity, // Full width
            height: double.infinity, // Full height
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg-dark.jpg'), // Background image
                fit: BoxFit.cover, // Cover the entire container
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize space usage
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'KOREAN QUIZ',
                    style: AppTypography.mainTitleDark(context),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Responsive.heightPercentage(context, 2)),
                  SizedBox(
                    width: Responsive.widthPercentage(context, 90),
                    child: Text(
                      'Dive Into Building Your Korean with interactive quizzes',
                      textAlign: TextAlign.center,
                      style: AppTypography.mainDescriptionDark(context),
                    ),
                  ),
                  SizedBox(height: Responsive.heightPercentage(context, 3)),
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/flashcard');
                    },
                    text: 'Vocabulary Card',
                    icon: Icons.style_outlined,
                  ),
                  SizedBox(height: Responsive.heightPercentage(context, 3)),
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/multiplechoice');
                    },
                    text: 'Multiple Choice',
                    icon: Icons.library_add_check_outlined,
                  ),
                  SizedBox(height: Responsive.heightPercentage(context, 3)),
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/shortanswer');
                    },
                    text: 'Short Answer',
                    icon: Icons.textsms_outlined,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Responsive.heightPercentage(context, 5),
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center align footer text
              children: [
                Text(
                  'INFT 3101 Mobile Development',
                  textAlign: TextAlign.center,
                  style: AppTypography.staticCopywrite,
                ),
                Text(
                  '\u00a9 2024 2AIR',
                  textAlign: TextAlign.center,
                  style: AppTypography.staticCopywrite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
