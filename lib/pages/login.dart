// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import '../utils/UserState.dart';
import '../widgets/custom_app_bar.dart';
import '../utils/sessionControl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class UserService {
  static void printFormattedJsonResponse(String response) {
    try {
      final jsonResponse = json.decode(response);
      final prettyJson =
          const JsonEncoder.withIndent('  ').convert(jsonResponse);
      print("🌐 Raw JSON Response:\n$prettyJson\n");
    } catch (e) {
      print("🚫 Error decoding JSON response: $e");
    }
  }

  static Future<List<dynamic>> fetchUsers() async {
    final String response = await rootBundle.loadString('lib/data/users.json');
    printFormattedJsonResponse(response);
    final Map<String, dynamic> data = json.decode(response);
    return data['users'] ?? [];
  }
}

class _LoginPageState extends State<LoginPage> {
  List _users = [];
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
    _checkSession(); // Load session on startup
  }

  Future<void> _loadUsers() async {
    try {
      _users = await UserService.fetchUsers();
      setState(() {
        print("Users loaded: ${_users.length}");
      });
    } catch (e) {
      print("Error loading users: $e");
    }
  }

  Future<void> _checkSession() async {
    String? loggedInUser = await loadSession(); // Load session
    if (loggedInUser != null) {
      // User is already logged in
      Provider.of<UserState>(context, listen: false).login(loggedInUser);
      Navigator.pushNamed(context, '/'); // Navigate to the home page
    }
  }

  Future<void> login(String username, String password) async {
    final user = _users.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => null,
    );

    if (user != null) {
      Provider.of<UserState>(context, listen: false).login(username);
      await saveSession(username); // Save the session
      print("Login successful!");
      Navigator.pushNamed(context, '/');
    } else {
      _showErrorDialog("Invalid username or password.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Login Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isLoggedIn: false),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-dark.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                controller: usernameController,
                hintText: 'Username',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: passwordController,
                hintText: 'Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();
                        login(username, password);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 0, 122, 255)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                      ),
                      child: const Text(
                        'LOG-IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 13),
                  SizedBox(
                    width: 150,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                      ),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 122, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'INFT 3101 Mobile Development',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Text(
                '\u00a9 2024 2AIR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFCCCCCC)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: Icon(icon, color: const Color(0xFFCCCCCC)),
        ),
      ),
    );
  }
}
