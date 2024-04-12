import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/aboutus_screen.dart';
import 'package:flutter_application_2/screens/contactus_screen.dart';
import 'package:flutter_application_2/screens/edit_profile.dart';
import 'package:flutter_application_2/screens/settings_screen.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  String _userName = 'User Name'; // Add a variable to store the user name

  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Select Image"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            GestureDetector(
                              child: Text("Gallery"),
                              onTap: () {
                                getImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            GestureDetector(
                              child: Text("Camera"),
                              onTap: () {
                                getImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 40,
                backgroundImage:
                    _imageFile != null ? FileImage(_imageFile!) : null,
                child: _imageFile == null
                    ? Icon(Icons.add_a_photo)
                    : null, // Placeholder icon if no image is selected
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              _userName, // Use the user name variable here
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Thank you for using our app! As a local business we thank you for suppoting us and hope you enjoy.',
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 131, 24),
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            buildButton(Icons.edit, 'Edit Profile'),
            buildButton(Icons.info, 'About Us'),
            buildButton(Icons.mail, 'Contact Us'),
            buildButton(Icons.exit_to_app, 'Log Out'),
          ],
        ),
      ),
    );
  }

  Widget buildButton(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to the corresponding page based on the button text
                if (text == 'Edit Profile') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  ).then((value) {
                    // Update user name if it's changed after editing profile
                    if (value != null && value is String) {
                      setState(() {
                        _userName = value;
                      });
                    }
                  });
                } else if (text == 'Contact Us') {
                  // Navigate to the ContactUsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                } else if (text == 'About Us') {
                  // Navigate to the AboutUsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                }
              },
              icon: Icon(icon, color: Colors.black), // Set icon color to black
              label: Text(
                text,
                style: TextStyle(
                  color: Colors.black, // Set text color to black
                ),
              ),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft, // Align text to the left
              ),
            ),
          ),
        ],
      ),
    );
  }
}
