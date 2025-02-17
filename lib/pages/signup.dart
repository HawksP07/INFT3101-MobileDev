// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:inft3101_group12_language_app/utils/JSON_CRUD.dart';
import 'package:inft3101_group12_language_app/widgets/custom_app_bar.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmController =
        TextEditingController();

    Future<void> signUp(
        String username, String password, String passwordConfirm) async {
      // Fetch existing users
      Map<String, dynamic> userData = await JsonCrud.readJson();
      List<dynamic> users = userData['users'] ?? [];

      // Debug output
      print("📦 Users Loaded: ${users.length} users found");
      for (var user in users) {
        print(
            "   - Username: ${user['username']}, Password: ${user['password']}");
      }
      print("🔑 Password: $password");
      print("👤 Username: $username");

      // Check for user existence
      bool userFound = users.any((user) => user['username'] == username);

      // Password confirmation check
      if (password != passwordConfirm) {
        print("Passwords do not match!");
        return;
      }

      if (userFound) {
        print("User already exists: $username");
      } else {
        // Add the new user and write to JSON
        await JsonCrud.addUser(username, password, 0, 0);
        print("User successfully created: $username");

        // Show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Login Successful"),
              content: Text(
                  "Your account has been created, restart the app to access your account."),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(isLoggedIn: false),
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg-dark.jpg'), fit: BoxFit.cover)),
          child: Column(
            children: [
              const SizedBox(height: 110),
              const Text('Sign-Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 60),
              const SizedBox(
                width: 290,
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 312.00,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 249, 249),
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 196, 196, 196),
                          fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      suffixIcon: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.email,
                            color: Color.fromARGB(255, 196, 196, 196)),
                      )),
                ),
              ),
              const SizedBox(height: 22),
              const SizedBox(
                width: 290,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 312.00,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 249, 249),
                      hintText: '********',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 196, 196, 196),
                          fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      suffixIcon: const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.remove_red_eye,
                              color: Color.fromARGB(255, 196, 196, 196)))),
                ),
              ),
              const SizedBox(height: 29),
              const SizedBox(
                width: 290,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 312.00,
                child: TextField(
                  controller: passwordConfirmController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 249, 249, 249),
                      hintText: '********',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 196, 196, 196),
                          fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      suffixIcon: const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.remove_red_eye,
                              color: Color.fromARGB(255, 196, 196, 196)))),
                ),
              ),
              const SizedBox(
                width: 352.00,
                child: CheckboxListTile(
                  value: false,
                  onChanged: null,
                  title: Text('Remember Password',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  controlAffinity: ListTileControlAffinity.leading,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 168,
                height: 44,
                child: ElevatedButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;
                      String passwordConfirm = passwordConfirmController.text;
                      signUp(username, password, passwordConfirm);
                    },
                    style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 0, 122, 255)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
              const SizedBox(height: 70),
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
          )),
    );
  }
}
