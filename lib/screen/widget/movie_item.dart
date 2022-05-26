import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../detail_screen.dart';

class MovieItem extends StatelessWidget {
  final Movie;
  const MovieItem({Key? key, required this.Movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Row(children: [
        Expanded(
          flex: 4,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: "https://www.themoviedb.org/t/p/w1280"+Movie.poster_path,
              fit: BoxFit.cover,
              width: 500,
              placeholder: (context, url) => Image.asset("images/skeleton_image_loading.gif", fit: BoxFit.cover,),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Movie.rating,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  Movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    Movie.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 105,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    color: Colors.black,
                    child: Row(
                      children: [
                        Text(
                          "Read More",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            movieFromHome: Movie,
                            originNav: "home",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
