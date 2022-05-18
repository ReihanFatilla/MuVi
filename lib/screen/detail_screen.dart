import 'package:flutter/material.dart';
import 'package:recipeapp/model/movie.dart';
import 'package:recipeapp/screen/main_page/home_screen.dart';

class DetailScreen extends StatelessWidget {
  final Movie movieFromHome;
  const DetailScreen({ Key? key, required this.movieFromHome }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.network(movieFromHome.imageUrls)
            ],
          ),
        ),
      ),    
    );
  }
}