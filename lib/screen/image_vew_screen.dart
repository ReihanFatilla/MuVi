import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:recipeapp/model/movie.dart';

class ImageViewScreen extends StatelessWidget {
  final Movie detailImage;
  const ImageViewScreen({Key? key, required this.detailImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Hero(
                tag: detailImage.poster_path,
                child: Image.network(
                    "https://www.themoviedb.org/t/p/w1280" +
                        detailImage.poster_path,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.contain)),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 230,
              width: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                IconButton(onPressed: () async {
                  await ImageDownloader.downloadImage("https://www.themoviedb.org/t/p/w1280"+detailImage.poster_path);
                },
                icon: Icon(
                  Icons.download,
                  color: Colors.white
                )),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
