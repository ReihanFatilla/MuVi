import 'package:flutter/material.dart';
import 'package:recipeapp/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Scaffold",
        primarySwatch: Colors.blue,
      ),
      home: const InputScreen(),
    );
  }
}