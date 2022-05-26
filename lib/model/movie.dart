import 'dart:convert';

class Movie {
  String title;
  String released;
  String rating;
  String desc;
  String poster_path;
  Movie({
    required this.title,
    required this.desc,
    required this.rating,
    required this.released,
    required this.poster_path,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"] ?? json["name"],
        desc: json["overview"] ?? 'Cerita tentang si yang paling paling',
        poster_path: json["poster_path"] ?? '',
        released: json["release_date"] ?? '2020-03-24',
        rating: json["vote_average"].toString() ?? "7.4",
      );

  static Map<String, dynamic> toMap(Movie movie) => {
        'title': movie.title,
        'overview': movie.desc,
        'poster_path': movie.poster_path,
        'release_Date': movie.released,
        'vote_average': movie.rating,
      };

  static String encode(List<Movie> movie) => json.encode(
        movie.map<Map<String, dynamic>>((movie) => Movie.toMap(movie)).toList(),
      );

  static List<Movie> decode(String movie) =>
      (json.decode(movie) as List<dynamic>)
          .map<Movie>((item) => Movie.fromJson(item))
          .toList();
}

List<Movie> MovieSkeletonData = [
  Movie(
      title: "-------",
      desc: "-------------------------------------------------",
      released: "-- -- ----",
      rating: "-.-",
      poster_path:
          ""),
  Movie(
      title: "-------",
      desc: "-------------------------------------------------",
      released: "-- -- ----",
      rating: "-.-",
      poster_path:
          ""),
  Movie(
      title: "-------",
      desc: "-------------------------------------------------",
      released: "-- -- ----",
      rating: "-.-",
      poster_path:
          "")
];
