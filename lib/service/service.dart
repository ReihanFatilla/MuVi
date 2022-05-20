import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipeapp/model/movie.dart';
import 'package:recipeapp/auth/secrets.dart';

String apiKey = myApiKey;
String baseUrl = "https://api.themoviedb.org/3/movie";

class MovieApi {
  Future<List<Movie>?> getFilm() async{
    List<Movie>? list;

    String url ="$baseUrl/now_playing?api_key=$apiKey";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data["results"] as List;
      list = result.map((json) => Movie.fromJson(json)).toList();
      return list;
    } else {
      throw Exception("Tidak Dapat Mengambil Data");
    }
    return list;
  }
  
}