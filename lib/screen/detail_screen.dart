import 'package:flutter/material.dart';
import 'package:recipeapp/helper/utils.dart';
import 'package:recipeapp/model/boomark_movie.dart';
import 'package:recipeapp/model/movie.dart';
import 'package:recipeapp/screen/image_vew_screen.dart';
import 'package:recipeapp/screen/main_page/home_screen.dart';

import '../sql/pref_helper.dart';

class DetailScreen extends StatefulWidget {
  final Movie movieFromHome;
  const DetailScreen({Key? key, required this.movieFromHome}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                            )),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // make favorite button
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        addWatchlist(
                          widget.movieFromHome.title,
                          widget.movieFromHome.desc,
                          widget.movieFromHome.rating,
                          widget.movieFromHome.released,
                          widget.movieFromHome.poster_path,
                          );
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: widget.movieFromHome.poster_path,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageViewScreen(
                          detailImage: widget.movieFromHome,
                        ),
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            "https://www.themoviedb.org/t/p/w1280" +
                                widget.movieFromHome.poster_path,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.movieFromHome.title,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            HelperFunction.formatMonth(
                                widget.movieFromHome.released),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.movieFromHome.rating,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 19,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  widget.movieFromHome.desc,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addWatchlist(String title, String desc, String rating, String released, String poster_path) {
    final prefs = PreferenceHelper();
    final bookmark = Movie(
      title: title,
      desc: desc,
      rating: rating,
      released: released,
      poster_path: poster_path,
    );
    prefs.addBookmark(bookmark);
  }
}