import 'package:flutter/material.dart';
import 'package:recipeapp/screen/main_page/saved_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late SharedPreferences logindata;
  late String username;

  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  int _currentIndex = 0;

  final List<Widget> _children = [HomeScreen(), SavedScreen()];

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_sharp,
              size: 25,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout, size: 20, color: Colors.black87),
            onPressed: () {},
          ),
        ],
        title: Text(
          "Hi Reihan!",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 25),
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 18),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
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
