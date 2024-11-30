// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List _users = [];

  Future<void> fetchUsers() async {
    // List<User> users = [];
      final String response = await rootBundle.loadString('users.json');
      final data = await json.decode(response);
      setState(() {
        _users = data['users'];
        print("...number of users ${_users.length}");
      });
      
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchUsers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          '2AIR',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),
        actions: [
          IconButton(onPressed: () {Navigator.pushNamed(context, '/login');}, icon: const Icon(Icons.perm_identity)),
          IconButton(onPressed: () {Navigator.pushNamed(context, '/settings');}, icon: const Icon(Icons.settings))
        ],
      ),
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
                      fetchUsers();
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
