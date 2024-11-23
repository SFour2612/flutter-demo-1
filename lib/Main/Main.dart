import 'package:app/SignUp/SignupScreen1.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignUpScreen1(),
    );
  }
}