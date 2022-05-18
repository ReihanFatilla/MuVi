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
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios,)
                    ),
                    Text("Back",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Hero(
                  tag: movieFromHome.imageUrls,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(movieFromHome.imageUrls, height: 250, width: double.infinity, fit: BoxFit.cover)
                    ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
Text(
                  movieFromHome.title,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movieFromHome.director,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey
                  ),
                )
                      ],
                    ),
                    Container(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    movieFromHome.age,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                  ]
                ),
                SizedBox(height: 30,),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  movieFromHome.desc,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
          ),
        ),
      ),    
    );
  }
}