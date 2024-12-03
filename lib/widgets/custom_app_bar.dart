import 'package:flutter/material.dart';
import '../theme/typo.dart';
import '../theme/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Title displayed in the AppBar
  final bool isLoggedIn; // Boolean flag to indicate login status

  const CustomAppBar({
    super.key,
    this.title = '3AIR', // Default title
    required this.isLoggedIn, // Require login status to customize AppBar actions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Set the AppBar background color
      title: Text(
        title, // Display the title text
        style: AppTypography.logo(context), // Use typography from theme
      ),
      actions: [
        // User icon changes based on login status
        IconButton(
          onPressed: () {
            if (isLoggedIn) {
              // Log out and navigate to the login screen
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                ModalRoute.withName('/'),
              );
            } else {
              // Navigate to the login screen
              Navigator.pushNamed(context, '/login');
            }
          },
          icon: Icon(
            isLoggedIn ? Icons.logout : Icons.perm_identity, // Toggle icon
            color: AppColors.darkGray, // Set icon color from theme
          ),
        ),
        IconButton(
          onPressed: () {
            // Navigate to the settings screen
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/settings',
              ModalRoute.withName('/'),
            );
          },
          icon: const Icon(
            Icons.settings, // Settings icon
            color: AppColors.darkGray, // Set icon color from theme
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // Sets the height of the AppBar
}
