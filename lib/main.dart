import 'package:flutter/material.dart';
import 'package:recipeapp/screen/login_screen.dart';
import 'package:recipeapp/screen/main_page/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Scaffold",
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}