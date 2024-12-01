// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:inft3101_group12_language_app/utils/user_service.dart';
import 'package:inft3101_group12_language_app/widgets/custom_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List _users = [];

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String username, String password) async {
  // Wait for the fetchUsers function to complete
  await UserService.fetchUsers();

  // debug stuff
  print("Users loaded: $_users");
  print("Password: $password");
  print("Username: $username");

  // Check for username and password match
  bool userFound = false;
  for (var user in _users) {
    if (user['username'] == username && user['password'] == password) {
      userFound = true;
      break;
    }
  }

  if (userFound) {
    print("Login successful!");
    Navigator.pushNamed(context, '/');
  } else {
    print("Invalid username or password.");
  }
}
  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await UserService.fetchUsers();
    setState(() {
      _users = users;
      print("Users loaded: ${_users.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-dark.jpg'),
            fit: BoxFit.cover
          )
        ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 171),
          const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: 312.00,
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 249, 249, 249),
                hintText: 'Username',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                suffixIcon: 
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.email, color: Color.fromARGB(255, 196, 196, 196)),
                  )
              ),
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: 312.00,
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 249, 249, 249),
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                suffixIcon: 
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye, color: Color.fromARGB(255, 196, 196, 196))
                  )
              ),
            ),
          ),
          const SizedBox(height: 29),
          const SizedBox(
            width: 352.00,
            child: CheckboxListTile(
              value: false, 
              onChanged: null,
              title: Text (
                'Remember Password',
                style: TextStyle(color: Colors.white, fontSize: 22)
              ),
              controlAffinity: ListTileControlAffinity.leading,
              fillColor: WidgetStatePropertyAll(Colors.white),
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 313.00,
            height: 44,
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;
                      login(username, password);
                    }, 
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 0, 122, 255)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ))
                    ), 
                    child: const Text(
                      'LOG-IN',  
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: 150,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    }, 
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ))
                    ), 
                    child: const Text(
                      'REGISTER',  
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 122, 255),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 155),
          const Text(
              'INFT 3101 Mobile Development',
              style: TextStyle(color: Colors.white, fontSize: 18),
              
          ),
          const Text(
            '\u00a9 2024 2AIR',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            
          ),
        ],
      )
      ),
    );
  }
}
