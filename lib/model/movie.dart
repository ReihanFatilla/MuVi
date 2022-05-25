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
        title: json["title"] ?? 'Si paling paling',
        desc: json["overview"] ?? 'Cerita tentang si yang paling paling',
        poster_path: json["poster_path"] ?? 'https://www.themoviedb.org/t/p/w1280/neMZH82Stu91d3iqvLdNQfqPPyl.jpg',
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
        movie
            .map<Map<String, dynamic>>((movie) => Movie.toMap(movie))
            .toList(),
      );

  static List<Movie> decode(String movie) =>
      (json.decode(movie) as List<dynamic>)
          .map<Movie>((item) => Movie.fromJson(item))
          .toList();
}

List<Movie> MovieData = [
  Movie(
      title: "Morbius",
      desc:
          "Dangerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Michael Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.",
      released: "2020-03-24",
      rating: "7.8",
      poster_path:
          "https://www.themoviedb.org/t/p/w1280/h4WLN3cmEjCsH1fNGRfvGV6IPBX.jpg")
];
