import 'package:recipeapp/model/boomark_movie.dart';
import 'package:recipeapp/model/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{

  // Add Bookmark
  void addBookmark(Movie selectedBook) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? previousDataString = prefs.getString('movie_key');

    List<Movie>? previousData =
        previousDataString == null ? null : Movie.decode(previousDataString);
      

    if (previousData == null) {
      final List<Movie> books = [selectedBook];
      prefs.setString('movie_key', Movie.encode(books));
    } else {
      previousData.add(selectedBook);
      prefs.setString('movie_key', Movie.encode(previousData));
    }
  }

  // Get Bookmark
  Future<List<Movie>> getBookmark() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? booksString = await prefs.getString('movie_key');

    final List<Movie> movie = Movie.decode(booksString!);
    return movie;
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