import 'package:flutter/material.dart';
import 'package:recipeapp/screen/main_page/saved_screen.dart';

import 'home_screen.dart';

class MainPage extends StatefulWidget {

  final String username;

  const MainPage({ Key? key, required this.username }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
  
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    SavedScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
            width: 10,
            margin: EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("images/img_profile.png", fit: BoxFit.cover)),
          ),
          title: Text("Hi ${widget.username}!", style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    }); 
  }
  
}