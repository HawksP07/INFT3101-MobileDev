import 'package:flutter/material.dart';
import 'package:inft3101_group12_language_app/pages/login.dart';
import 'package:inft3101_group12_language_app/pages/flashcard.dart';
import 'package:inft3101_group12_language_app/pages/multiplechoice.dart';
import 'package:inft3101_group12_language_app/pages/settings.dart';
import 'package:inft3101_group12_language_app/pages/shortanswer.dart';
import 'package:inft3101_group12_language_app/pages/signup.dart';
import './theme/typo.dart';
import './utils/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, // hide debug banner
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: '2AIR'),
        routes: {
          '/login': (context) => const LoginPage(),
          '/settings': (context) => const SettingsPage(),
          '/signup': (context) => const SignupPage(),
          '/flashcard': (context) => const FlashCardPage(),
          '/multiplechoice': (context) => const MultipleChoicePage(),
          '/shortanswer': (context) => const ShortAnswerPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              icon: const Icon(Icons.perm_identity)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg-dark.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: Responsive.heightPercentage(
                        context, 15)), // 15% of view height
                Text(
                  'KOREAN QUIZ',
                  style: AppTypography.mainTitleDark(context),
                ),
                SizedBox(height: Responsive.heightPercentage(context, 2)), //
                SizedBox(
                  width:
                      Responsive.widthPercentage(context, 90), // 90% view width
                  child: Text(
                    'Dive Into Building Your Korean with interactive quizzes',
                    textAlign: TextAlign.center,
                    style: AppTypography.mainDescriptionDark(context),
                  ),
                ),
                SizedBox(height: Responsive.heightPercentage(context, 3)),
                SizedBox(
                  width: 312,
                  height: 77.72,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/flashcard');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Stack(fit: StackFit.expand, children: [
                        Ink(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: AssetImage('assets/btn-dark.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 20,),
                              const Icon(
                                Icons.style_outlined,
                                color: Colors.white,
                                size: 44,
                              ),
                              const SizedBox(width: 20),
                              Builder(
                                builder: (context) {
                                  return Text(
                                    'Vocabulary Card',
                                    style: AppTypography.mainButtonTextDark(
                                        context),
                                  );
                                },
                              ),
                            ])
                      ])),
                ),
                SizedBox(height: Responsive.heightPercentage(context, 3)),
                SizedBox(
                  width: 312,
                  height: 77.72,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/multiplechoice');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Stack(fit: StackFit.expand, children: [
                        Ink(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: AssetImage('assets/btn-dark.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.library_add_check_outlined,
                                color: Colors.white,
                                size: 44,
                              ),
                              const SizedBox(width: 20),
                              Builder(
                                builder: (context) {
                                  return Text(
                                    'Multiple Choice',
                                    style: AppTypography.mainButtonTextDark(
                                        context),
                                  );
                                },
                              ),
                            ])
                      ])),
                ),
                SizedBox(height: Responsive.heightPercentage(context, 3)),
                SizedBox(
                  width: 312,
                  height: 77.72,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/shortanswer');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Stack(fit: StackFit.expand, children: [
                        Ink(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: AssetImage('assets/btn-dark.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.textsms_outlined,
                                color: Colors.white,
                                size: 44,
                              ),
                              const SizedBox(width: 20),
                              Builder(
                                builder: (context) {
                                  return Text(
                                    'Short Answer',
                                    style: AppTypography.mainButtonTextDark(
                                        context),
                                  );
                                },
                              ),
                            ])
                      ])),
                ),
                const Spacer(), // space
              ],
            ),
          ),

          // Footer positioned at the bottom
          Positioned(
            bottom: Responsive.heightPercentage(context, 5), // 10% from bottom
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'INFT 3101 Mobile Development',
                  textAlign: TextAlign.center,
                  style: AppTypography.copywriteDark(context),
                ),
                Text(
                  '\u00a9 2024 2AIR',
                  textAlign: TextAlign.center,
                  style: AppTypography.copywriteDark(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
