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
import './utils/UserState.dart';
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

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
                    style: AppTypography.mainTitleDark(context).copyWith(
                      fontSize: Responsive.widthPercentage(context, 8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Responsive.heightPercentage(context, 2)),
                  SizedBox(
                    width: Responsive.widthPercentage(context, 90),
                    child: Text(
                      'Dive Into Building Your Korean with interactive quizzes',
                      textAlign: TextAlign.center,
                      style:
                          AppTypography.mainDescriptionDark(context).copyWith(
                        fontSize: Responsive.widthPercentage(context, 4),
                      ),
                    ),
                  ),
                  SizedBox(height: Responsive.heightPercentage(context, 3)),
                  // Buttons Row for Landscape Mode
                  if (isLandscape)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSquareButton(
                          context,
                          text: 'Vocabulary Card',
                          icon: Icons.style_outlined,
                          onPressed: () =>
                              Navigator.pushNamed(context, '/flashcard'),
                        ),
                        _buildSquareButton(
                          context,
                          text: 'Multiple Choice',
                          icon: Icons.library_add_check_outlined,
                          onPressed: () =>
                              Navigator.pushNamed(context, '/multiplechoice'),
                        ),
                        _buildSquareButton(
                          context,
                          text: 'Short Answer',
                          icon: Icons.textsms_outlined,
                          onPressed: () =>
                              Navigator.pushNamed(context, '/shortanswer'),
                        ),
                      ],
                    )
                  else
                    // Buttons Column for Portrait Mode
                    Column(
                      children: [
                        MainButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/flashcard');
                          },
                          text: 'Vocabulary Card',
                          icon: Icons.style_outlined,
                        ),
                        SizedBox(
                            height: Responsive.heightPercentage(context, 1)),
                        MainButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/multiplechoice');
                          },
                          text: 'Multiple Choice',
                          icon: Icons.library_add_check_outlined,
                        ),
                        SizedBox(
                            height: Responsive.heightPercentage(context, 1)),
                        MainButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/shortanswer');
                          },
                          text: 'Short Answer',
                          icon: Icons.textsms_outlined,
                        ),
                      ],
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
                  '© 2024 2AIR',
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

  Widget _buildSquareButton(BuildContext context,
      {required String text,
      required IconData icon,
      required VoidCallback onPressed}) {
    final size = Responsive.widthPercentage(
        context, 25); // Square size relative to width
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size, size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: size * 0.4), // Icon size relative to button size
          SizedBox(height: size * 0.1),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTypography.mainDescriptionDark(context).copyWith(
              fontSize: size * 0.12,
            ),
          ),
        ],
      ),
    );
  }
}
