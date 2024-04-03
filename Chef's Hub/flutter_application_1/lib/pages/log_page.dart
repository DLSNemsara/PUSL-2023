import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '::/auth.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}): super(key: key);

  @override
  State<Login_page> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login_page> { 
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword()async{
    try {
      await Auth().signInWithEmailAndPassword(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
      ); } on FirebaseAuthException catch (e) {setState(() {
      errorMessage = e.message;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}