import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/color.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';
import '../theme/typo.dart';
import '../utils/themeNotifier.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _volume = 50;

  final List<Color> _availableColors = [
    AppColors.darkBackground,
    AppColors.lightGray,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      backgroundColor: themeNotifier.backgroundColor,
      appBar: const CustomAppBar(isLoggedIn: true),
      bottomNavigationBar: const BottomNavBar(currentIndex: null),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).padding.bottom + 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              'Settings',
              style: themeNotifier.isDarkMode
                  ? AppTypography.mainTitleDark(context)
                  : AppTypography.mainTitleLight(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // Volume Control
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.volume_up, size: 30),
                    const SizedBox(width: 16),
                    Text(
                      'Volume',
                      style: TextStyle(
                        fontSize: 18,
                        color: themeNotifier.isDarkMode
                            ? AppColors.darkGray
                            : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                          _volume > 0 ? Icons.volume_up : Icons.volume_off),
                      onPressed: () {
                        setState(() {
                          _volume = 0;
                        });
                      },
                    ),
                    Expanded(
                      child: Slider(
                        value: _volume,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        label: _volume.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            _volume = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Color Selection
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.color_lens_outlined, size: 30),
                        const SizedBox(width: 16),
                        Text(
                          'Colors',
                          style: TextStyle(
                            fontSize: 18,
                            color: themeNotifier.isDarkMode
                                ? AppColors.darkGray
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      children: _availableColors.map((color) {
                        return GestureDetector(
                          onTap: () {
                            themeNotifier.updateBackgroundColor(color);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: color == themeNotifier.backgroundColor
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Dark Mode Toggle
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.dark_mode, size: 30),
                    const SizedBox(width: 16),
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 18,
                        color: themeNotifier.isDarkMode
                            ? AppColors.darkGray
                            : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: themeNotifier.isDarkMode,
                      onChanged: (value) {
                        themeNotifier.toggleTheme();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
