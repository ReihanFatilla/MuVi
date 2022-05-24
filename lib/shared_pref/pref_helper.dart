import 'package:recipeapp/model/boomark_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{
  
// Write DATA
static Future saveBookmark(String title, String desc, String rating, String released, String poster_path) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(title, title);
    await sharedPreferences.setString(desc, desc);
    await sharedPreferences.setString(rating, rating);
    await sharedPreferences.setString(released, released);
    await sharedPreferences.setString(poster_path, poster_path);
  }

// Write DATA
static Future clearBookmark() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
  
    
// Read Data


static Future<BookmarkMovie> getBookmark(String title, String desc, String rating, String released, String poster_path) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? mTitle = sharedPreferences.getString(title);
    String? mDesc = sharedPreferences.getString(desc);
    String? mRating = sharedPreferences.getString(rating);
    String? mReleased = sharedPreferences.getString(released);
    String? mPosterPath = sharedPreferences.getString(poster_path);

    BookmarkMovie newBookmark = BookmarkMovie(
      title: mTitle,
      desc: mDesc,
      rating: mRating,
      released: mReleased,
      poster_path: mPosterPath,
    );

    return newBookmark;
  }
}