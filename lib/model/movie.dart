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

var movieApiData = [
    {
      "adult": false,
      "backdrop_path": "/gG9fTyDL03fiKnOpf2tr01sncnt.jpg",
      "genre_ids": [
        28,
        878,
        14
      ],
      "id": 526896,
      "original_language": "en",
      "original_title": "Morbius",
      "overview": "Dangerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Michael Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.",
      "popularity": 11236.546,
      "poster_path": "/6JjfSchsU6daXk2AKX8EEBjO3Fm.jpg",
      "release_date": "2022-03-30",
      "title": "Morbius",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 1125
    },
    {
      "adult": false,
      "backdrop_path": "/A3bsT0m1um6tvcmlIGxBwx9eAxn.jpg",
      "genre_ids": [
        28,
        12,
        35,
        10749
      ],
      "id": 752623,
      "original_language": "en",
      "original_title": "The Lost City",
      "overview": "A reclusive romance novelist was sure nothing could be worse than getting stuck on a book tour with her cover model until a kidnapping attempt sweeps them both into a cutthroat jungle adventure, proving life can be so much stranger, and more romantic, than any of her paperback fictions.",
      "popularity": 11288.261,
      "poster_path": "/neMZH82Stu91d3iqvLdNQfqPPyl.jpg",
      "release_date": "2022-03-24",
      "title": "The Lost City",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 768
    },
    {
      "adult": false,
      "backdrop_path": "/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg",
      "genre_ids": [
        28,
        878,
        35,
        10751,
        12
      ],
      "id": 675353,
      "original_language": "en",
      "original_title": "Sonic the Hedgehog 2",
      "overview": "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands.",
      "popularity": 7088.307,
      "poster_path": "/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg",
      "release_date": "2022-03-30",
      "title": "Sonic the Hedgehog 2",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 1622
    },
    {
      "adult": false,
      "backdrop_path": "/cqnVuxXe6vA7wfNWubak3x36DKJ.jpg",
      "genre_ids": [
        28,
        12,
        14,
        53
      ],
      "id": 639933,
      "original_language": "en",
      "original_title": "The Northman",
      "overview": "Prince Amleth is on the verge of becoming a man when his father is brutally murdered by his uncle, who kidnaps the boy's mother. Two decades later, Amleth is now a Viking who's on a mission to save his mother, kill his uncle and avenge his father.",
      "popularity": 7895.411,
      "poster_path": "/zhLKlUaF1SEpO58ppHIAyENkwgw.jpg",
      "release_date": "2022-04-07",
      "title": "The Northman",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 1095
    },
    {
      "adult": false,
      "backdrop_path": "/xHrp2pq73oi9D64xigPjWW1wcz1.jpg",
      "genre_ids": [
        80,
        9648,
        53
      ],
      "id": 414906,
      "original_language": "en",
      "original_title": "The Batman",
      "overview": "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
      "popularity": 6372.913,
      "poster_path": "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
      "release_date": "2022-03-01",
      "title": "The Batman",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 4767
    },
    {
      "adult": false,
      "backdrop_path": "/figlwUsXXFehX3IebdjqNLV6vWk.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 628900,
      "original_language": "en",
      "original_title": "The Contractor",
      "overview": "After being involuntarily discharged from the U.S. Special Forces, James Harper decides to support his family by joining a private contracting organization alongside his best friend and under the command of a fellow veteran. Overseas on a covert mission, Harper must evade those trying to kill him while making his way back home.",
      "popularity": 4386.168,
      "poster_path": "/rJPGPZ5soaG27MK90oKpioSiJE2.jpg",
      "release_date": "2022-03-10",
      "title": "The Contractor",
      "video": false,
      "vote_average": 6.6,
      "vote_count": 249
    },
    {
      "adult": false,
      "backdrop_path": "/fEe5fe82qHzjO4yej0o79etqsWV.jpg",
      "genre_ids": [
        16,
        35,
        28,
        10751,
        80
      ],
      "id": 629542,
      "original_language": "en",
      "original_title": "The Bad Guys",
      "overview": "When the infamous Bad Guys are finally caught after years of countless heists and being the world’s most-wanted villains, Mr. Wolf brokers a deal to save them all from prison.",
      "popularity": 2651.704,
      "poster_path": "/7qop80YfuO0BwJa1uXk1DXUUEwv.jpg",
      "release_date": "2022-03-17",
      "title": "The Bad Guys",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 494
    },
    {
      "adult": false,
      "backdrop_path": "/AdyJH8kDm8xT8IKTlgpEC15ny4u.jpg",
      "genre_ids": [
        14,
        28,
        12
      ],
      "id": 453395,
      "original_language": "en",
      "original_title": "Doctor Strange in the Multiverse of Madness",
      "overview": "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
      "popularity": 3108.869,
      "poster_path": "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
      "release_date": "2022-05-04",
      "title": "Doctor Strange in the Multiverse of Madness",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 1852
    },
    {
      "adult": false,
      "backdrop_path": "/i0zbSmiyyylh7H3Qb4jgscz46Pm.jpg",
      "genre_ids": [
        27
      ],
      "id": 893370,
      "original_language": "es",
      "original_title": "Virus-32",
      "overview": "A virus is unleashed and a chilling massacre runs through the streets of Montevideo.",
      "popularity": 2552.751,
      "poster_path": "/wZiF79hbhLK1U2Pj9bF67NAKXQR.jpg",
      "release_date": "2022-04-21",
      "title": "Virus:32",
      "video": false,
      "vote_average": 7,
      "vote_count": 54
    },
    {
      "adult": false,
      "backdrop_path": "/dW3fQJrshh2wYDoW4HUA7ZabsN1.jpg",
      "genre_ids": [
        28,
        53,
        80
      ],
      "id": 763285,
      "original_language": "en",
      "original_title": "Ambulance",
      "overview": "Decorated veteran Will Sharp, desperate for money to cover his wife's medical bills, asks for help from his adoptive brother Danny. A charismatic career criminal, Danny instead offers him a score: the biggest bank heist in Los Angeles history: 32 million.",
      "popularity": 3529.926,
      "poster_path": "/zT5ynZ0UR6HFfWQSRf2uKtqCyWD.jpg",
      "release_date": "2022-03-16",
      "title": "Ambulance",
      "video": false,
      "vote_average": 7,
      "vote_count": 654
    },
    {
      "adult": false,
      "backdrop_path": "/jIdZmqElYgNwlCsUtCwmN1rDu7I.jpg",
      "genre_ids": [
        80,
        18,
        53
      ],
      "id": 799876,
      "original_language": "en",
      "original_title": "The Outfit",
      "overview": "Leonard is an English tailor who used to craft suits on London’s world-famous Savile Row. After a personal tragedy, he’s ended up in Chicago, operating a small tailor shop in a rough part of town where he makes beautiful clothes for the only people around who can afford them: a family of vicious gangsters.",
      "popularity": 2638.232,
      "poster_path": "/lZa5EB6PVJBT5mxhgZS5ftqdAm6.jpg",
      "release_date": "2022-02-25",
      "title": "The Outfit",
      "video": false,
      "vote_average": 7,
      "vote_count": 231
    },
    {
      "adult": false,
      "backdrop_path": "/qNRkfXBdAuXk9Qs3BEDIfmbAK9w.jpg",
      "genre_ids": [
        80,
        28
      ],
      "id": 883502,
      "original_language": "en",
      "original_title": "Fortress: Sniper's Eye",
      "overview": "Weeks after the deadly assault on Fortress Camp, Robert makes a daring rescue to save Sasha, the widow of his old nemesis Balzary. But back in the camp's command bunker, it appears Sasha may have devious plans of her own. As a new attack breaks out, Robert is confronted with a familiar face he thought he'd never see again…",
      "popularity": 2731.554,
      "poster_path": "/61J34xHVVdQHbJ4MSCWQo4e727v.jpg",
      "release_date": "2022-04-29",
      "title": "Fortress: Sniper's Eye",
      "video": false,
      "vote_average": 6,
      "vote_count": 50
    },
    {
      "adult": false,
      "backdrop_path": "/zGLHX92Gk96O1DJvLil7ObJTbaL.jpg",
      "genre_ids": [
        28,
        12,
        14
      ],
      "id": 338953,
      "original_language": "en",
      "original_title": "Fantastic Beasts: The Secrets of Dumbledore",
      "overview": "Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald's growing legion of followers.",
      "popularity": 2051.16,
      "poster_path": "/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg",
      "release_date": "2022-04-06",
      "title": "Fantastic Beasts: The Secrets of Dumbledore",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 1092
    },
    {
      "adult": false,
      "backdrop_path": "/xicKILMzPn6XZYCOpWwaxlUzg6S.jpg",
      "genre_ids": [
        53,
        28
      ],
      "id": 294793,
      "original_language": "en",
      "original_title": "All the Old Knives",
      "overview": "When the CIA discovers one of its agents leaked information that cost more than 100 people their lives, veteran operative Henry Pelham is assigned to root out the mole with his former lover and colleague Celia Harrison.",
      "popularity": 2255.528,
      "poster_path": "/g4tMniKxol1TBJrHlAtiDjjlx4Q.jpg",
      "release_date": "2022-04-08",
      "title": "All the Old Knives",
      "video": false,
      "vote_average": 6,
      "vote_count": 248
    },
    {
      "adult": false,
      "backdrop_path": "/An1nKjXahrChfEbZ3MAE8fsiut1.jpg",
      "genre_ids": [
        27
      ],
      "id": 661791,
      "original_language": "es",
      "original_title": "La abuela",
      "overview": "A Paris model must return to Madrid where her grandmother, who raised her, has had a stroke. But spending just a few days with this relative turns into an unexpected nightmare.",
      "popularity": 854.178,
      "poster_path": "/eIUixNvox4U4foL5Z9KbN9HXYSM.jpg",
      "release_date": "2022-01-28",
      "title": "The Grandmother",
      "video": false,
      "vote_average": 5.9,
      "vote_count": 166
    },
    {
      "adult": false,
      "backdrop_path": "/tq3klWQevRK0Or0cGhsw0h3FDWQ.jpg",
      "genre_ids": [
        12,
        16,
        35,
        10751,
        14
      ],
      "id": 676705,
      "original_language": "fr",
      "original_title": "Pil",
      "overview": "Pil, a little vagabond girl, lives on the streets of the medieval city of Roc-en-Brume, along with her three tame weasels. She survives of food stolen from the castle of the sinister Regent Tristain. One day, to escape his guards, Pil disguises herself as a princess. Thus she embarks upon a mad, delirious adventure, together with Crobar, a big clumsy guard who thinks she's a noble, and Rigolin, a young crackpot jester. Pil is going to have to save Roland, rightful heir to the throne under the curse of a spell. This adventure will turn the entire kingdom upside down, and teach Pil that nobility can be found in all of us.",
      "popularity": 823.51,
      "poster_path": "/abPQVYyNfVuGoFUfGVhlNecu0QG.jpg",
      "release_date": "2021-08-11",
      "title": "Pil's Adventures",
      "video": false,
      "vote_average": 6.8,
      "vote_count": 86
    },
    {
      "adult": false,
      "backdrop_path": "/yzH5zvuEzzsHLZnn0jwYoPf0CMT.jpg",
      "genre_ids": [
        53,
        28
      ],
      "id": 760926,
      "original_language": "en",
      "original_title": "Gold",
      "overview": "In the not-too-distant future, two drifters traveling through the desert stumble across the biggest gold nugget ever found and the dream of immense wealth and greed takes hold. They hatch a plan to excavate their bounty, with one man leaving to secure the necessary tools while the other remains with the gold. The man who remains must endure harsh desert elements, ravenous wild dogs, and mysterious intruders, while battling the sinking suspicion that he has been abandoned to his fate.",
      "popularity": 860.925,
      "poster_path": "/ejXBuNLvK4kZ7YcqeKqUWnCxdJq.jpg",
      "release_date": "2022-01-13",
      "title": "Gold",
      "video": false,
      "vote_average": 6.4,
      "vote_count": 256
    },
    {
      "adult": false,
      "backdrop_path": "/6mJrgL7Mi13XjJeGYJFlD6UEVQw.jpg",
      "genre_ids": [
        16,
        35,
        10751,
        10402
      ],
      "id": 438695,
      "original_language": "en",
      "original_title": "Sing 2",
      "overview": "Buster and his new cast now have their sights set on debuting a new show at the Crystal Tower Theater in glamorous Redshore City. But with no connections, he and his singers must sneak into the Crystal Entertainment offices, run by the ruthless wolf mogul Jimmy Crystal, where the gang pitches the ridiculous idea of casting the lion rock legend Clay Calloway in their show. Buster must embark on a quest to find the now-isolated Clay and persuade him to return to the stage.",
      "popularity": 735.083,
      "poster_path": "/aWeKITRFbbwY8txG5uCj4rMCfSP.jpg",
      "release_date": "2021-12-01",
      "title": "Sing 2",
      "video": false,
      "vote_average": 8.1,
      "vote_count": 2755
    },
    {
      "adult": false,
      "backdrop_path": "/tH1afdfqqrYTP3l2oqsHEsNN5ul.jpg",
      "genre_ids": [
        16,
        10751,
        35
      ],
      "id": 678287,
      "original_language": "en",
      "original_title": "Marmaduke",
      "overview": "Great Dane Marmaduke epitomizes the overgrown lapdog, with an irascible streak and a penchant for mischief that is tempered with a deep sense of love and responsibility for his human family, the Winslows. The new animation is set in the world of elite dog shows, rife divas, rivalries and slapstick comedy.",
      "popularity": 692.359,
      "poster_path": "/tvhX4QQnMyMjlFeShLCXovvbf0c.jpg",
      "release_date": "2022-04-28",
      "title": "Marmaduke",
      "video": false,
      "vote_average": 5.6,
      "vote_count": 14
    },
    {
      "adult": false,
      "backdrop_path": "/8pgKccb5PfE1kWB9qqiXJem83VC.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 522016,
      "original_language": "en",
      "original_title": "The 355",
      "overview": "A group of top female agents from American, British, Chinese, Columbian and German  government agencies are drawn together to try and stop an organization from acquiring a deadly weapon to send the world into chaos.",
      "popularity": 426.097,
      "poster_path": "/uQt2dJFMnJmAp9zLAWNfGilK0BW.jpg",
      "release_date": "2022-01-05",
      "title": "The 355",
      "video": false,
      "vote_average": 6,
      "vote_count": 451
    }
  ];
