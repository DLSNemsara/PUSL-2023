import 'package:flutter/material.dart';

class CommmnuityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your message here',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement your send button functionality here
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
