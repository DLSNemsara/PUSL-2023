import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/loading_screen.dart';
import 'package:flutter_application_2/screens/main_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange[500],
      ),
      home: MainScreen(),
    );
  }
}