// ignore_for_file: avoid_print
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:inft3101_group12_language_app/pages/login.dart';
import 'package:inft3101_group12_language_app/pages/flashcard.dart';
import 'package:inft3101_group12_language_app/pages/multiplechoice.dart';
import 'package:inft3101_group12_language_app/pages/settings.dart';
import 'package:inft3101_group12_language_app/pages/shortanswer.dart';
import 'package:inft3101_group12_language_app/pages/signup.dart';
import 'backend/db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await MongoDatabase.connect();
    print("Successfully connected to MongoDB.");
  } catch (e) {
    print("Error connecting to MongoDB: $e");
  }
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
      body: Container(
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
            const SizedBox(height: 171),
            const Text(
              'KOREAN QUIZ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 28),
            const SizedBox(
              width: 376,
              child: Text(
                'Dive Into Building Your Korean with interactive quizzes',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
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
                    const Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Icon(
                            Icons.style_outlined,
                            color: Colors.white,
                            size: 44,
                          ),
                          SizedBox(width: 20),
                          Text('Vocabulary Card',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24))
                        ])
                  ])),
            ),
            const SizedBox(height: 20),
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
                    const Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Icon(
                            Icons.library_add_check_outlined,
                            color: Colors.white,
                            size: 44,
                          ),
                          SizedBox(width: 20),
                          Text('Multiple Choice',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24))
                        ])
                  ])),
            ),
            const SizedBox(height: 20),
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
                    const Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(width: 20),
                          Icon(
                            Icons.textsms_outlined,
                            color: Colors.white,
                            size: 44,
                          ),
                          SizedBox(width: 20),
                          Text('Short Answer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24))
                        ])
                  ])),
            ),
            const SizedBox(height: 103),
            const Text(
              'INFT 3101 Mobile Development',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              '\u00a9 2024 2AIR',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
