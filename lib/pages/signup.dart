import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
          IconButton(onPressed: () {Navigator.pushNamed(context, '/login');}, icon: Icon(Icons.perm_identity)),
          IconButton(onPressed: () {Navigator.pushNamed(context, '/settings');}, icon: Icon(Icons.settings))
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
          const SizedBox(height: 110),
          const Text(
            'Sign-Up',
            style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 60),
          const SizedBox(
            width: 290,
            child: Text (
              'Email Address',
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
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 249, 249, 249),
                hintText: 'Email Address',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196),
                  fontSize: 18
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
          const SizedBox(
            width: 290,
            child: Text (
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
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 249, 249, 249),
                hintText: '********',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196),
                  fontSize: 18
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
            width: 290,
            child: Text (
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
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 249, 249, 249),
                hintText: '********',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 196, 196, 196),
                  fontSize: 18
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
            width: 168,
            height: 44,
            child: ElevatedButton(
              onPressed: null, 
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 122, 255)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ))
              ), 
              child: const Text(
                'SIGN UP',  
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
            ),
          ),
          const SizedBox(height: 70),
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
