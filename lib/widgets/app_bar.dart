import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          icon: const Icon(Icons.perm_identity),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
