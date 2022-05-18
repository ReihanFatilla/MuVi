import 'package:flutter/material.dart';
import 'package:recipeapp/screen/main_page/home_screen.dart';

import 'main_page/main_navigation.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({ Key? key }) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  TextEditingController textFieldController = TextEditingController();
  String errorMessage = "";
  
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
                checkIfNameIsEmpty();
              },
            ),
          ],
        ),
      ),
    );
  }
  // get the text in the TextField and start the Second Screen
  void _sendDataToHomeScreen(BuildContext context) {
    String inputName = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(username: inputName)),
        );
  }

  void checkIfNameIsEmpty() {
    if (textFieldController.text.isEmpty) {
      setState(() {
        errorMessage = "Please enter your name";
      });
    } else {
      _sendDataToHomeScreen(context);
    }
  }
}