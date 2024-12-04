import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/color.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';
import '../utils/UserState.dart';
import '../theme/typo.dart';

class SettingsPage extends StatefulWidget {
  final Function(bool) onThemeToggle;

  const SettingsPage({super.key, required this.onThemeToggle});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _volume = 50;
  bool _isDarkMode = true; // Default to dark mode
  Color _selectedColor = AppColors.primary;

  final List<Color> _availableColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  bool get isLoggedIn {
    final userState = Provider.of<UserState>(context, listen: false);
    return userState.username != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: CustomAppBar(isLoggedIn: isLoggedIn),
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
            // Title
            Text(
              'Settings',
              style: _isDarkMode
                  ? AppTypography.mainTitleDark(context) // Dark mode style
                  : AppTypography.mainTitleLight(context), // Light mode style
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
                        color: _isDarkMode ? AppColors.darkGray : Colors.black,
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
                            color:
                                _isDarkMode ? AppColors.darkGray : Colors.black,
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
                            setState(() {
                              _selectedColor = color;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: color == _selectedColor
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
                        color: _isDarkMode ? AppColors.darkGray : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: _isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          _isDarkMode = value;
                        });
                        widget.onThemeToggle(value);
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
