import 'package:flutter/material.dart';
import 'package:nextchefapp/loginApp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  final Future<User?> user = AuthClass().authStateChanges.first;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.data != null) {
            return MyAppslogin();
          } else {
            ////////////////////////
            ///
            return Scaffold(
              appBar: AppBar(
                title: const Text('Account Settings'),
              ),
              body: Column(
                children: <Widget>[
                  Image.network(
                    'https://cdn.vectorstock.com/i/preview-1x/34/96/man-login-to-social-media-app-mobile-or-computer-vector-47203496.jpg',
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Hey there! Could you please log into your account for more details?',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAppslogin()),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            );

            /////////////////////////
          }
        }
      },
    );
  }
}
