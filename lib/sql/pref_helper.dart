import 'package:flutter/material.dart';
import 'package:recipeapp/helper/utils.dart';
import 'package:recipeapp/model/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{

  // Add Bookmark
  void addBookmark(Movie selectedMovie, context ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? previousDataString = prefs.getString('movie_key');

    if(previousDataString.toString().contains(selectedMovie.title.toString())){
      ScaffoldMessenger.of(context).showSnackBar(HelperFunction.showMySnackBar(selectedMovie.title + " Is Already in Watch List"));
      return;
    }

    List<Movie>? previousData =
        previousDataString == null ? null : Movie.decode(previousDataString);
      

    if (previousData == null) {
      final List<Movie> books = [selectedMovie];
      prefs.setString('movie_key', Movie.encode(books));
    } else {
      previousData.add(selectedMovie);
      prefs.setString('movie_key', Movie.encode(previousData));
      ScaffoldMessenger.of(context).showSnackBar(HelperFunction.showMySnackBar(selectedMovie.title + " Bookmarked!"));
    }
    print(previousDataString);
  }

  // Get Bookmark
  Future<List<Movie>> getBookmark() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? booksString = await prefs.getString('movie_key');

    final List<Movie> movie = Movie.decode(booksString!);
    return movie;
  }

  void removeBookmark(int index, context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final previousDataString = prefs.getString('movie_key');

    List<Movie>? previousData =
        previousDataString == null ? null : Movie.decode(previousDataString);

    if (previousData == null) {
      return;
    } else {
      final List<Movie> books = [...previousData];
      ScaffoldMessenger.of(context).showSnackBar(HelperFunction.showMySnackBar(books[index].title + " Removed from Bookmark"));
      books.remove(books[index]);
      prefs.setString('movie_key', Movie.encode(books));
    }
  }

  // Clear Bookmark
static Future clearBookmark() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
  
// // Write DATA
// static Future saveBookmark(String title, String desc, String rating, String released, String poster_path) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.setString(title, title);
//     await sharedPreferences.setString(desc, desc);
//     await sharedPreferences.setString(rating, rating);
//     await sharedPreferences.setString(released, released);
//     await sharedPreferences.setString(poster_path, poster_path);
//   }
  
    
// // Read Data


// static Future<BookmarkMovie> getBookmark(String title, String desc, String rating, String released, String poster_path) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? mTitle = sharedPreferences.getString(title);
//     String? mDesc = sharedPreferences.getString(desc);
//     String? mRating = sharedPreferences.getString(rating);
//     String? mReleased = sharedPreferences.getString(released);
//     String? mPosterPath = sharedPreferences.getString(poster_path);

//     BookmarkMovie newBookmark = BookmarkMovie(
//       title: mTitle,
//       desc: mDesc,
//       rating: mRating,
//       released: mReleased,
//       poster_path: mPosterPath,
//     );

//     return newBookmark;
//   }
}