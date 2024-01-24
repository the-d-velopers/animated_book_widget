import 'dart:math' as math;

import 'package:animated_book_list/animated_book_list.dart';
import 'package:flutter/material.dart';

///Creating a class object
class Cd {
  String cdCoverImgUrl;
  String cdDiscImgUrl;
  List<Color> cdGradient;

  Cd(
      {required this.cdCoverImgUrl,
      required this.cdDiscImgUrl,
      required this.cdGradient});
}

///Simulates a background query with response a List of objects
List<Cd> cds = [
  Cd(
    cdCoverImgUrl:
        'https://m.media-amazon.com/images/I/81ogsUqshzL._SX425_.jpg',
    cdDiscImgUrl:
        'https://www.theaudiodb.com/images/media/album/cdart/rtvxpt1429303647.png',
    cdGradient: [Colors.black, Colors.black45],
  ),
  Cd(
    cdCoverImgUrl:
        'https://m.media-amazon.com/images/I/61OBOiVbkeL._SX425_.jpg',
    cdDiscImgUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgyYQF3KPf68-hsZXiqpr0TJboii0XhbKMi1aD7423DpcqTszjech6cBfqFEuSM7qBUQS-_TjZMMCafWlCJOZfqkzRVfuNSCOL9BQSu8L94hiYW33JWp37YCX684YlOGC-kyi6FDloHXBwpTOApv9Fia69H_vTMVzUSrZeFU5_0YedwBM7GzrsUvXYz4A/s1600/1973%20The%20Dark%20Side%20Of%20The%20Moon%20(C.D%20E.U%2030th%20SACD)%20(4B).png',
    cdGradient: [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple
    ],
  ),
  Cd(
    cdCoverImgUrl:
        'https://m.media-amazon.com/images/I/91G5ndi8yFL._SX425_.jpg',
    cdDiscImgUrl:
        'https://d2bzx2vuetkzse.cloudfront.net/unshoppable_producs/3f3ec57e-80d2-4f73-a2a5-6bbeeeaf72f7.png',
    cdGradient: [Colors.black, Colors.grey, Colors.blue, Colors.black],
  )
];

///Widget class example
class BuilderConstructorCdsExample extends StatelessWidget {
  final bool horizontalView;

  BuilderConstructorCdsExample({
    super.key,
    required this.horizontalView,
  });

  @override
  Widget build(BuildContext context) {
    ///List of all objects
    return AnimatedBookList.builder(
      ///Scroll axis
      scrollDirection: horizontalView ? Axis.horizontal : Axis.vertical,

      ///Number of items on the list
      itemCount: cds.length,

      //Item constructor
      itemBuilder: (_, index) {
        ///For each object we return a widget constructor with the data.
        return AnimatedBookWidget.builder(
          ///Size parameter
          size: horizontalView ? Size.fromWidth(225) : Size.fromHeight(225),

          ///Padding for each element of the list
          padding: EdgeInsets.symmetric(
              vertical: horizontalView ? 0 : 10,
              horizontal: horizontalView ? 10 : 0),

          ///The cover element for the book
          cover: Image.network(
            cds[index].cdCoverImgUrl,
            fit: BoxFit.cover,
          ),

          ///Creates the child inside the book
          contentChild: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.network(cds[index].cdDiscImgUrl),
          ),

          ///Customize the back content  and use the animation based on open cover animation
          contentBuilder: (context, cdAnimation, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: cds[index].cdGradient),
              ),

              ///Animate the child
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scale(cdAnimation.value)
                  ..rotateZ(cdAnimation.value * (2 * math.pi)),
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
