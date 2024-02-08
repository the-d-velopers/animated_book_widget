import 'package:animated_book_widget/animated_book_widget.dart';
import 'package:flutter/material.dart';

/// Creating a class object.
class InspirationBook {
  InspirationBook({
    required this.coverImgUrl,
    required this.imageSilhouetteUrl,
  });

  final String coverImgUrl;
  final String imageSilhouetteUrl;
}

/// Simulates a background query with response a List of objects.
List<InspirationBook> inspirationBooks = [
  InspirationBook(
    coverImgUrl:
        'https://i.pinimg.com/originals/20/29/91/202991d2c637c19df48e376ad3ed30cf.jpg',
    imageSilhouetteUrl:
        'https://www.clipartqueen.com/image-files/male-profile-silhouette.png',
  ),
  InspirationBook(
    coverImgUrl:
        'https://img2.wallspic.com/previews/6/3/8/4/4/144836/144836-galaxy-cloud-blue-atmosphere-nature-x350.jpg',
    imageSilhouetteUrl:
        'https://www.clipartqueen.com/image-files/male-profile-silhouette.png',
  ),
  InspirationBook(
    coverImgUrl:
        'https://burst.shopifycdn.com/photos/elaborate-building-interior-with-light-teal-walls.jpg?width=1000&format=pjpg&exif=0&iptc=0',
    imageSilhouetteUrl:
        'https://www.clipartqueen.com/image-files/male-profile-silhouette.png',
  ),
];

/// Widget class example.
class InspirationExample extends StatelessWidget {
  const InspirationExample({
    required this.horizontalView,
    super.key,
  });

  final bool horizontalView;

  Size get heightSize => const Size.fromHeight(225);

  Size get widthSize => const Size.fromWidth(160);

  @override
  Widget build(BuildContext context) {
    /// List of all objects.
    return ListView.separated(
      /// Physics.
      physics: const BouncingScrollPhysics(),

      /// Scroll axis.
      scrollDirection: horizontalView ? Axis.horizontal : Axis.vertical,

      /// Separator of list.
      separatorBuilder: (context, index) => horizontalView
          ? const SizedBox(width: 20)
          : const SizedBox(height: 20),

      /// Number of items on the list.
      itemCount: inspirationBooks.length,

      /// None clip.
      clipBehavior: Clip.none,

      /// Item constructor.
      itemBuilder: (_, index) {
        /// For each object we return a widget with the data..
        final Image imageSilhouetteUrl = Image.network(
          inspirationBooks[index].imageSilhouetteUrl,
        );

        return AnimatedBookWidget(
          /// Size perameter.
          size: horizontalView ? widthSize : heightSize,

          ///Background and Content Border Radius parameter
          backgroundBorderRadius:
              BorderRadius.horizontal(right: Radius.circular(10)),

          ///Cover parameter
          cover: ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(10)),
            child: Image.network(
              inspirationBooks[index].coverImgUrl,
              fit: BoxFit.cover,
            ),
          ),

          /// Content parameter.
          content: ColoredBox(
            color: const Color(0xFFF1F1F1),
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
                        color: const Color(0xFF81F79F),
                        child: imageSilhouetteUrl,
                      ),
                      Container(
                        height: 90,
                        width: 65,
                        color: const Color(0xFF01DFD7),
                        child: imageSilhouetteUrl,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 90,
                        width: 65,
                        color: const Color(0xFFF5DA81),
                        child: imageSilhouetteUrl,
                      ),
                      Container(
                        height: 90,
                        width: 65,
                        color: const Color(0xFF819FF7),
                        child: imageSilhouetteUrl,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
