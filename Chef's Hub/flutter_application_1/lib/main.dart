import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
import 'package:flutter_application_1/widget_tree.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/browse.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/screens/community_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/loading_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';

/////////////////////
import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: LoginPage(),
    );
  }
}