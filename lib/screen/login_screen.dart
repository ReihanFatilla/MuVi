import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_page/main_navigation.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({ Key? key }) : super(key: key);
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  late SharedPreferences logindata;
  late bool loginStatus;

  TextEditingController textFieldController = TextEditingController();
  String errorMessage = "";

  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    loginStatus = (logindata.getBool('isLogin') ?? false);
    if (loginStatus == true) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MainPage()));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/img_profile.png', height: 200,),
            SizedBox(height: 50),
            TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                labelText: 'Enter Your Name',
                labelStyle: TextStyle(fontFamily: "poppins"),

              ),
            ),
            Text(errorMessage,
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontFamily: "poppins"
            ),),
            SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
              ),
              color: Colors.blue,
              child: const Text('Confirm', style: TextStyle(color: Colors.white, fontFamily: "poppins"),),
              onPressed: () {
                String username = textFieldController.text;
                if (username != '') {
                  logindata.setBool('isLogin', true);
                  logindata.setString('username', username);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
              }
              },
            ),
          ],
        ),
      ),
    );
  }

  void checkIfNameIsEmpty() {
    if (textFieldController.text.isEmpty) {
      setState(() {
        errorMessage = "Please enter your name";
      });
    } else {
      logindata.setBool('isLogin', true);
      String username = textFieldController.text;
                  logindata.setString('username', username);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
    }
  }
}