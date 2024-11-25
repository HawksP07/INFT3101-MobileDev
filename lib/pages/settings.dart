import 'package:flutter/material.dart';
import 'package:inft3101_group12_language_app/widgets/bottom_nav.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
          const SizedBox(height: 110),
          const Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)
          ),
        const SizedBox(height: 60),
        SizedBox(
            width: 312,
            height: 77.72,
            child: ElevatedButton(
              onPressed: null, 
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container (
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white
                    ),
                  ),
                  const Row (
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 22),
                      Icon(
                        Icons.tune_outlined,
                        color: Color.fromARGB(255, 0, 122, 255),
                        size: 24,
                      ),
                      SizedBox(width: 17),
                      Text(
                        'Volume',
                        style: TextStyle(
                          color: Color.fromARGB(255, 73, 69, 79),
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        )
                      ),
                      SizedBox(width: 115),
                      Icon(
                        Icons.volume_off_outlined,
                        color: Color.fromARGB(255, 73, 69, 79),
                        size: 38,
                      ),
                      
                      
                    ]
                  )
                ]
              )
            ),
          ),
        const SizedBox(height: 22),
        SizedBox(
          width: 312,
          height: 183,
          child: ElevatedButton(
            onPressed: null, 
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container (
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),
                  child: const Column(
                    children: [
                      Row (
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 22),
                    Icon(
                      Icons.colorize,
                      color: Color.fromARGB(255, 0, 122, 255),
                      size: 24,
                    ),
                    SizedBox(width: 17),
                    Text(
                      'Colors',
                      style: TextStyle(
                        color: Color.fromARGB(255, 73, 69, 79),
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      )
                    ),
                  ]
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 1,
                  width: 280,
                  child: ColoredBox(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row (
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 78,
                        width: 78,
                        child: ColoredBox(color: Color.fromARGB(255, 175, 82, 222)),
                      ),
                      SizedBox( // THESE COULD BE RADIO BUTTONS DUH
                        height: 78,
                        width: 202,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Color.fromARGB(255, 0, 122, 255)),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Color.fromARGB(255, 52, 199, 89)),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Color.fromARGB(255, 255, 204, 0)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Color.fromARGB(255, 122, 198, 245)),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Color.fromARGB(255, 175, 82, 222)),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Color.fromARGB(255, 88, 86, 214)),
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: ColoredBox(color: Color.fromARGB(255, 255, 45, 85)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]
                  ),
                ),
                    ],
                  ),
                ),
              ]
            )
          ),
        ),
        const SizedBox(height: 22),
        SizedBox(
          width: 312,
          height: 77.72,
          child: ElevatedButton(
            onPressed: null, 
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container (
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),
                ),
                const Row (
                    children: [
                      SizedBox(width: 22),
                      Icon(
                        Icons.nightlight_outlined,
                        color: Color.fromARGB(255, 0, 122, 255),
                        size: 24,
                      ),
                      SizedBox(width: 17),
                      Text(
                        'Dark',
                        style: TextStyle(
                          color: Color.fromARGB(255, 73, 69, 79),
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        )
                      ),
                      SizedBox(width: 125),
                      Switch(
                        value: true,
                        thumbColor: WidgetStatePropertyAll(Color.fromARGB(255, 73, 69, 79)),
                        trackOutlineColor: WidgetStatePropertyAll(Color.fromARGB(255, 73, 69, 79)),
                        trackOutlineWidth: WidgetStatePropertyAll(5), 
                        onChanged: null,
                      ),
                    ]
                  )
                ]
              )
            ),
          ),
        ],
      )
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2)
    );
  }
}
