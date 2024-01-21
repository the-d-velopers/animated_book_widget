import 'package:animated_book_list/animated_book_list.dart';
import 'package:flutter/material.dart';

///Creating a class object
class InspirationBook {
  String coverImgUrl;
  String imageSilhouetteUrl;

  InspirationBook(
      {required this.coverImgUrl, required this.imageSilhouetteUrl});
}

///Simulates a background query with response a List of objects
List<InspirationBook> inspirationBooks = [
  InspirationBook(
      coverImgUrl:
          'https://i.pinimg.com/originals/20/29/91/202991d2c637c19df48e376ad3ed30cf.jpg',
      imageSilhouetteUrl:
          'https://www.pngkit.com/png/full/64-644639_male-head-silhouette-png-vector-black-and-white.png'),
  InspirationBook(
      coverImgUrl:
          'https://img2.wallspic.com/previews/6/3/8/4/4/144836/144836-galaxy-cloud-blue-atmosphere-nature-x350.jpg',
      imageSilhouetteUrl:
          'https://www.pngkit.com/png/full/64-644639_male-head-silhouette-png-vector-black-and-white.png'),
  InspirationBook(
      coverImgUrl:
          'https://burst.shopifycdn.com/photos/elaborate-building-interior-with-light-teal-walls.jpg?width=1000&format=pjpg&exif=0&iptc=0',
      imageSilhouetteUrl:
          'https://www.pngkit.com/png/full/64-644639_male-head-silhouette-png-vector-black-and-white.png'),
];

///Widget class example
class InspirationExample extends StatelessWidget {
  final bool horizontalView;

  InspirationExample({
    super.key,
    required this.horizontalView,
  });

  @override
  Widget build(BuildContext context) {
    ///List of all objects
    return AnimatedBookList.separated(
      ///Scroll axis
      scrollDirection: horizontalView ? Axis.horizontal : Axis.vertical,

      ///Separator of list
      separatorBuilder: (context, index) => horizontalView
          ? const SizedBox(width: 20)
          : const SizedBox(height: 20),

      ///Number of items on the list
      itemCount: inspirationBooks.length,

      ///Item constructor
      itemBuilder: (_, index) {
        ///For each object we return a widget with the data.
        return AnimatedBookWidget(
          ///Size perameter
          size: horizontalView ? Size.fromWidth(160) : Size.fromHeight(225),

          ///Cover parameter
          cover: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            child: Image.network(
              inspirationBooks[index].coverImgUrl,
              fit: BoxFit.cover,
            ),
          ),
          contentBuilder: (context, bookAnimation, child) {
            return SizedBox.expand(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(bookAnimation.value),
                child: child,
              ),
            );
          },
          contentChild: Container(
            color: Color(0xFFF1F1F1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 90,
                        width: 65,
                        color: Color(0xFF81F79F),
                        child: Image.network(
                          inspirationBooks[index].imageSilhouetteUrl,
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 65,
                        color: Color(0xFF01DFD7),
                        child: Image.network(
                          inspirationBooks[index].imageSilhouetteUrl,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 90,
                        width: 65,
                        color: Color(0xFFF5DA81),
                        child: Image.network(
                          inspirationBooks[index].imageSilhouetteUrl,
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 65,
                        color: Color(0xFF819FF7),
                        child: Image.network(
                          inspirationBooks[index].imageSilhouetteUrl,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
