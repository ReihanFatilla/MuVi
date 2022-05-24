class Movie{
  Movie({
    required this.title,
    required this.desc,
    required this.rating,
    required this.released,
    required this.poster_path,
});

  String title;
  String released;
  String rating;
  String desc;
  String poster_path;
  
factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    title: json["title"] ?? 'Si paling paling',
    desc: json["overview"] ?? 'Cerita tentang si yang paling paling',
    poster_path: json["poster_path"] ?? 'https://www.themoviedb.org/t/p/w1280/neMZH82Stu91d3iqvLdNQfqPPyl.jpg',
    released: json["release_date"] ?? '2020-03-24',
    rating: json["vote_average"].toString() ?? "7.4",
  );
  
}

var MovieData = [
  Movie(
    title: "Morbius", 
    desc: "Dangerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Michael Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.", 
    released: "2020-03-24", 
    rating: "7.8", 
    poster_path: "https://www.themoviedb.org/t/p/w1280/h4WLN3cmEjCsH1fNGRfvGV6IPBX.jpg"
    )
];