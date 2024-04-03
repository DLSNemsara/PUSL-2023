import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}): super(key: key);
  
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
  }

Widget _title(){
  return const Text("FirebaseAuth");
}
Widget _userUId(){
  return Text(user?.email ?? 'User Email');
}
Widget _signOutButton(){
  return ElevatedButton(onPressed: signOut, child: const Text('Sign out'));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: _title(),
      ), // AppBar
      body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: <Widget>[
      _userUId(),
      _signOutButton(),
      ], // <widget>[]
      ), // Column
      ), // Container
      );
  }
}