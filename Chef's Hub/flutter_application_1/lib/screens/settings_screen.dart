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
  String _selectedTheme = 'Light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
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
          Text(
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
          Text(
            'Theme',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: _selectedTheme,
            onChanged: (newValue) {
              setState(() {
                _selectedTheme = newValue!;
              });
            },
            items: <String>['Light', 'Dark'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
