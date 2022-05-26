import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/model/movie.dart';
import 'package:recipeapp/screen/detail_screen.dart';
import 'package:recipeapp/screen/widget/carousel_slider.dart';
import 'package:recipeapp/screen/widget/movie_item.dart';
import 'package:recipeapp/service/service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movie = MovieApi();

    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Now Playing",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: movie.getNowPlayingMovie(),
                  builder: (context, snapshot) => snapshot.data != null
                      ? _carouselMovie(snapshot.data as List<Movie>)
                      : _carouselMovie(MovieSkeletonData)),
              SizedBox(
                height: 10,
              ),
              Text(
                "Today's Trending",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: movie.getPopularMovie(),
                  builder: (context, snapshot) => snapshot.data != null
                      ? _listMovie(snapshot.data as List<Movie>)
                      : _listMovie(MovieSkeletonData)),
            ],
          )),
    ));
  }

  Widget _listMovie(List<Movie> movie) {
    return ListView.builder(
        itemBuilder: (context, index) => MovieItem(Movie: movie[index]),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: movie.length);
  }

  Widget _carouselMovie(List<Movie> movie) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, ),
      child: CarouselSlider.builder(
        itemCount: movie.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 350,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 0.7,
          aspectRatio: 5.0,
        ),
        itemBuilder: (context, i, id) {
          return MovieCarouselSlider(movie: movie[i]);
        },
      ),
    );
  }
}
