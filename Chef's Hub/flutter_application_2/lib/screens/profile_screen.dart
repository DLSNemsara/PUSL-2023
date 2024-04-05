import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/pp.JPG'),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                      caption: TextStyle(color: Colors.black), // Font color
                    ),
              ),
              child: DropdownButton<String>(
                hint: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.black), // Font color
                ),
                style: TextStyle(color: Colors.black), // Font color
                items: const [
                  DropdownMenuItem(
                    child: Text('Pick Image from Gallery'),
                    value: 'gallery',
                  ),
                  DropdownMenuItem(
                    child: Text('Pick Image from Camera'),
                    value: 'camera',
                  ),
                ],
                onChanged: (value) async {
                  if (value == 'gallery') {
                    //final picker = ImagePicker();
                    // Handle the picked file from gallery
                  } else if (value == 'camera') {
                    //final picker = ImagePicker();
                    // Handle the picked file from camera
                  }
                },
                underline: Container(
                  height: 2,
                  color: Colors.grey[300], // Border color
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle other actions
              },
              child: const Text('Other Action'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: const Text('Settings'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle log out action
              },
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
