import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/model/boomark_movie.dart';
import 'package:recipeapp/screen/detail_screen.dart';
import 'package:recipeapp/service/service.dart';
import 'package:recipeapp/sql/pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/movie.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  var movieApi = MovieApi();

  late BookmarkMovie movie;

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
        child: FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {

              final SharedPreferences? prefs = snapshot.data;
            final String? undecodedMoviewatchlist = prefs?.getString('book_key');

            final List<BookmarkMovie> movieWatchlist = BookmarkMovie.decode(undecodedMoviewatchlist!);

              return SizedBox(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: CarouselSlider.builder(
                    itemCount: MovieData.length,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 450,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      reverse: false,
                      viewportFraction: 0.7,
                      aspectRatio: 5.0,
                    ),
                    itemBuilder: (context, i, id) {
                      Movie dataRecipe = MovieData[i];
                      
                      return FutureBuilder(
                  future: movieApi.getNowPlayingMovie(),
                  builder: (context, snapshot){

                    List<BookmarkMovie> movieWL = snapshot.data;
                    final BookmarkMovie MarkMovie = movieWL
                    .firstWhere((movie) => movie.title == movieWatchlist[i].title);

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
                                      tag: MarkMovie.title,
                                      child: Image.network(
                                        dataRecipe.poster_path,
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  dataRecipe.title,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Text(
                                    dataRecipe.desc,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          dataRecipe.rating,
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
                                movieFromHome: dataRecipe,
                              ),
                            ),
                          );
                        },
                      );
                  }
                  
                  snapshot.data != null
                      ? _carouselMovie(snapshot.data as List<Movie>)
                      : Center(child: CircularProgressIndicator())),
                      
                    },
                  ),
                ),
              );
            }),
      ),
    ]));
  }
}
