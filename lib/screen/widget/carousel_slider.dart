import 'package:flutter/material.dart';
import 'package:recipeapp/screen/detail_screen.dart';

class MovieCarouselSlider extends StatelessWidget {
  final movie;
  const MovieCarouselSlider({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white,
            )),
        child: Hero(
          tag: movie.poster_path,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://www.themoviedb.org/t/p/w1280"+movie.poster_path,
              width: 500,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              movieFromHome: movie,
              originNav: "home",
            ),
          ),
        );
      },
    );
  }
}
