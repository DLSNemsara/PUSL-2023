import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isGlutenFree = false;
  bool _notificationsEnabled = true;
  ThemeMode _selectedTheme = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            const Text(
              'Dietary Restrictions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Vegetarian'),
              value: _isVegetarian,
              onChanged: (newValue) {
                setState(() {
                  _isVegetarian = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Vegan'),
              value: _isVegan,
              onChanged: (newValue) {
                setState(() {
                  _isVegan = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Gluten-Free'),
              value: _isGlutenFree,
              onChanged: (newValue) {
                setState(() {
                  _isGlutenFree = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (newValue) {
                setState(() {
                  _notificationsEnabled = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            const Text(
              'Theme',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButton<ThemeMode>(
              value: _selectedTheme,
              onChanged: (newValue) {
                setState(() {
                  _selectedTheme = newValue!;
                  _applyTheme(_selectedTheme);
                });
              },
              items: ThemeMode.values.map((ThemeMode mode) {
                return DropdownMenuItem<ThemeMode>(
                  value: mode,
                  child: Text(mode == ThemeMode.light ? 'Light' : 'Dark'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _applyTheme(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        _setLightTheme();
        break;
      case ThemeMode.dark:
        _setDarkTheme();
        break;
      default:
        _setLightTheme();
    }
  }

  void _setLightTheme() {
    final theme = ThemeData.light();
    // You can customize the light theme further if needed
    // For example: theme.copyWith(...)
    MyApp.setAppTheme(theme);
  }

  void _setDarkTheme() {
    final theme = ThemeData.dark();
    // You can customize the dark theme further if needed
    // For example: theme.copyWith(...)
    MyApp.setAppTheme(theme);
  }
}

class MyApp extends StatelessWidget {
  static ThemeData? _appTheme;

  static void setAppTheme(ThemeData theme) {
    _appTheme = theme;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _appTheme ?? ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: Text(
            'Change the theme from settings',
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
