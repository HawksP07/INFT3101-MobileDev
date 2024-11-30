import 'package:flutter/material.dart';
import '../theme/typo.dart';
import '../theme/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: AppTypography.mainTitleDark(context),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          icon: const Icon(Icons.perm_identity, color: AppColors.darkGray),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          icon: const Icon(Icons.settings, color: AppColors.darkGray),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
