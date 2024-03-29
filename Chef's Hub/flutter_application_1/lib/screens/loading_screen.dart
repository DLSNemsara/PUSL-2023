import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo widget goes here
            Image.asset(
              'assets/logo.png', 
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
