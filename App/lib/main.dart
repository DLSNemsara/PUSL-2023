import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/aboutus_screen.dart';
import 'package:flutter_application_2/screens/browse.dart';
import 'package:flutter_application_2/screens/community_screen.dart';
import 'package:flutter_application_2/screens/contactus_screen.dart';
import 'package:flutter_application_2/screens/loading_screen.dart';
import 'package:flutter_application_2/screens/login_screen.dart';
import 'package:flutter_application_2/screens/main_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:flutter_application_2/screens/shoppingsist_page.dart';
import 'package:flutter_application_2/screens/signup_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 14, 103, 14),
      ),
      home:SignUpScreen(),
    );
  }
}