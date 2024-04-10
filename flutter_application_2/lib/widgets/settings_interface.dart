import 'package:flutter/material.dart';

class SettingsInterface extends StatelessWidget {
  final bool isVegetarian;
  final bool isVegan;
  final bool isGlutenFree;
  final bool notificationsEnabled;
  final ThemeMode selectedTheme;
  final ValueChanged<bool> onVegetarianChanged;
  final ValueChanged<bool> onVeganChanged;
  final ValueChanged<bool> onGlutenFreeChanged;
  final ValueChanged<bool> onNotificationsChanged;
  final ValueChanged<ThemeMode> onThemeChanged;
  final VoidCallback onSubmit;

  const SettingsInterface({
    Key? key,
    required this.isVegetarian,
    required this.isVegan,
    required this.isGlutenFree,
    required this.notificationsEnabled,
    required this.selectedTheme,
    required this.onVegetarianChanged,
    required this.onVeganChanged,
    required this.onGlutenFreeChanged,
    required this.onNotificationsChanged,
    required this.onThemeChanged,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Dietary Restrictions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Vegetarian'),
              value: isVegetarian,
              onChanged: onVegetarianChanged as void Function(bool?),
            ),
            CheckboxListTile(
              title: Text('Vegan'),
              value: isVegan,
              onChanged: onVeganChanged as void Function(bool?),
            ),
            CheckboxListTile(
              title: Text('Gluten-Free'),
              value: isGlutenFree,
              onChanged: onGlutenFreeChanged as void Function(bool?),
            ),
            SizedBox(height: 20),
            Divider(height: 30, color: Colors.grey[400]),
            Text(
              'Notifications',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: notificationsEnabled,
              onChanged: onNotificationsChanged,
            ),
            SizedBox(height: 20),
            Divider(height: 30, color: Colors.grey[400]),
            Text(
              'Theme',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            DropdownButton<ThemeMode>(
              value: selectedTheme,
              onChanged: onThemeChanged as void Function(ThemeMode?),
              items: ThemeMode.values.map((ThemeMode mode) {
                return DropdownMenuItem<ThemeMode>(
                  value: mode,
                  child: Text(
                    mode == ThemeMode.light ? 'Light Theme' : 'Dark Theme',
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: onSubmit,
              child: Text('Submit', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.green, // Use backgroundColor instead of primary
                // onSurface: Colors.white, // Use onSurface instead of onPrimary
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
