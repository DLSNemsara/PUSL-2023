import 'package:flutter/material.dart';

class ThemeSelectionScreen extends StatelessWidget {
  const ThemeSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Selection'),
      ),
      body: Center(
        child: Text('Theme Selection Screen'),
      ),
    );
  }
}
