import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/screen/detail_screen.dart';

class MovieCarouselSlider extends StatelessWidget {
  final movie;
  const MovieCarouselSlider({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: movie.poster_path,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: "https://www.themoviedb.org/t/p/w1280"+movie.poster_path,
            fit: BoxFit.cover,
            width: 500,
            placeholder: (context, url) => Image.asset("images/skeleton_image_loading.gif", fit: BoxFit.cover,),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          // child: Image.network(
          //   movie.poster_path,
          //   width: 500,
          //   fit: BoxFit.cover,
          //   loadingBuilder: (BuildContext context, Widget child,
          //           ImageChunkEvent? loadingProgress) {
          //         if (loadingProgress == null) return child;
          //         return Center(
          //           child: CircularProgressIndicator(
          //             value: loadingProgress.expectedTotalBytes != null
          //                 ? loadingProgress.cumulativeBytesLoaded /
          //                     loadingProgress.expectedTotalBytes!
          //                 : null,
          //           ),
          //         );
          //       },
          // ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              movieFromHome: movie,
              originNav: "home",
            ),
          ),
        );
      },
    );
  }
}
