import 'package:exam_musicplayce/screens/home.dart';
import 'package:exam_musicplayce/screens/login.dart';
import 'package:exam_musicplayce/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exam MusicPlayce',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}