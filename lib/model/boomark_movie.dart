// import 'dart:convert';

// class BookmarkMovie{

//   String? title;
//   String? released;
//   String? rating;
//   String? desc;
//   String? poster_path;

//   BookmarkMovie({
//     required this.title,
//     required this.desc,
//     required this.rating,
//     required this.released,
//     required this.poster_path,
// });

// factory BookmarkMovie.fromJson(Map<String, dynamic> jsonData) {
//     return BookmarkMovie(
//       title: jsonData['title'],
//       released: jsonData['released'],
//       rating: jsonData['rating'],
//       desc: jsonData['desc'],
//       poster_path: jsonData['poster_path'],
//     );
//   }

//   static Map<String, dynamic> toMap(BookmarkMovie movie) => {
//         'title': movie.title,
//         'released': movie.released,
//         'rating': movie.rating,
//         'desc': movie.desc,
//         'poster_path': movie.poster_path,
//       };

// static String encode(List<BookmarkMovie> movie) => json.encode(
//         movie
//             .map<Map<String, dynamic>>((Movie) => BookmarkMovie.toMap(Movie))
//             .toList(),
//       );

//   static List<BookmarkMovie> decode(String movie) =>
//       (json.decode(movie) as List<dynamic>)
//           .map<BookmarkMovie>((item) => BookmarkMovie.fromJson(item))
//           .toList();
// }