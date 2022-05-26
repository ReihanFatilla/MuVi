import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/screen/detail_screen.dart';
import 'package:recipeapp/screen/widget/movie_item.dart';
import 'package:recipeapp/service/service.dart';
import 'package:recipeapp/sql/pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/movie.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  var prefs = PreferenceHelper();
  var movieApi = MovieApi();

  // late Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Your Watch List",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
            child: FutureBuilder(
                future: prefs.getBookmark(),
                builder: (context, snapshot) => snapshot.hasData
                    ? _watchListMovie(snapshot.data as List<Movie>)
                    : _watchListMovie(MovieSkeletonData))),
      ]),
    );
  }

  Widget _watchListMovie(List<Movie> listMovie) {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.all(15),
        child: CarouselSlider.builder(
          itemCount: listMovie.length,
          options: listMovie.length <= 1
              ? CarouselOptions(
                  enlargeCenterPage: true,
                  height: 450,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.7,
                  aspectRatio: 5.0,
                )
              : CarouselOptions(
                  enlargeCenterPage: true,
                  height: 450,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  reverse: false,
                  viewportFraction: 0.7,
                  aspectRatio: 5.0,
                ),
          itemBuilder: (context, i, id) {
            // print(listMovie[i].poster_path);
            // PreferenceHelper.clearBookmark();
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  padding: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Hero(
                            tag: listMovie[i].poster_path,
                            child: CachedNetworkImage(
                              imageUrl: "https://www.themoviedb.org/t/p/w1280"+listMovie[i].poster_path,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              placeholder: (context, url) =>
                              Image.asset(
                                "images/skeleton_image_loading.gif",
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        listMovie[i].title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          listMovie[i].desc,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                listMovie[i].rating,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      movieFromHome: listMovie[i],
                      originNav: "saved",
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Widget _listMovie(List<Movie> movie) {
  //   return ListView.builder(
  //       itemBuilder: (context, index) => MovieItem(Movie: movie[index]),
  //       scrollDirection: Axis.vertical,
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       itemCount: movie.length);
  // }
}
