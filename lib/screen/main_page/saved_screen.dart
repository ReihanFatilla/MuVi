import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/movie.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Saved Movies",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        margin: EdgeInsets.all(15),
        child: CarouselSlider.builder(
          itemCount: MovieData.length,
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: 400,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            reverse: false,
            viewportFraction: 0.7,
            aspectRatio: 5.0,
          ),
          itemBuilder: (context, i, id) {
            Movie dataRecipe = MovieData[i];
            return GestureDetector(
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      dataRecipe.poster_path,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            );
          },
        ),
      ),
    ]));
  }
}
