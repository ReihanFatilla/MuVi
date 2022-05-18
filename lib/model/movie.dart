class Movie{
  String title;
  String director;
  String age;
  String desc;
  String imageUrls;

  Movie({
    required this.title,
    required this.desc,
    required this.age,
    required this.director,
    required this.imageUrls,
});
}

var MovieData = [
  Movie(title: "Morbius", desc: "Dangerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Michael Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.", director: "Daniel Espinosa", age: "PG-13"  ,imageUrls: "https://www.themoviedb.org/t/p/w1280/h4WLN3cmEjCsH1fNGRfvGV6IPBX.jpg"),
  Movie(title: "The Northman", desc: "Prince Amleth is on the verge of becoming a man when his father is brutally murdered by his uncle, who kidnaps the boy's mother. Two decades later, Amleth is now a Viking who's on a mission to save his mother, kill his uncle and avenge his father.", age: "R", director: "Robert Eggers", imageUrls: "https://www.themoviedb.org/t/p/w1280/zhLKlUaF1SEpO58ppHIAyENkwgw.jpg"),
  Movie(title: "The Batman", desc: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.", director: "Matt Reeves", age: "R13+" , imageUrls: "https://www.themoviedb.org/t/p/w1280/seyWFgGInaLqW7nOZvu0ZC95rtx.jpg"),
  Movie(title: "Operation Mincemeat", desc: "In 1943, two British intelligence officers concoct Operation Mincemeat, wherein their plan to drop a corpse with false papers off the coast of Spain would fool Nazi spies into believing the Allied forces were planning to attack by way of Greece rather than Sicily.", director: "John Madden", age: "PG-13" , imageUrls: "https://www.themoviedb.org/t/p/w1280/tfdfh1mK24VujxT5z11732asxdR.jpg"),
  Movie(title: "Sonic the Hedgehog 2", desc: "When the infamous Bad Guys are finally caught after years of countless heists and being the world’s most-wanted villains, Mr. Wolf brokers a deal to save them all from prison.", director: "Pierre Perifel", age: "PG" , imageUrls: "https://www.themoviedb.org/t/p/w1280/7qop80YfuO0BwJa1uXk1DXUUEwv.jpg"),
];