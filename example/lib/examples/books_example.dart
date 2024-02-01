import 'package:animated_book_widget/animated_book_widget.dart';
import 'package:flutter/material.dart';

/// Creating a class object.
class Book {
  Book({
    required this.bookAuthorImgUrl,
    required this.bookCoverImgUrl,
    required this.bookDescription,
  });

  final String bookAuthorImgUrl;
  final String bookCoverImgUrl;
  final String bookDescription;
}

/// Simulates a background query with response a List of objects.
List<Book> books = [
  Book(
    bookAuthorImgUrl:
        'https://www.clipartqueen.com/image-files/male-profile-silhouette.png',
    bookCoverImgUrl:
        'https://content.wepik.com/statics/90897927/preview-page0.jpg',
    bookDescription:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit, ligula aliquam magnis lobortis euismod suscipit luctus, curae rhoncus nascetur malesuada condimentum potenti. Viverra felis aptent mi cum ante tristique ut dignissim, vivamus donec justo nibh posuere lacinia morbi at, fusce ornare massa primis ullamcorper neque tempus. Convallis dis nullam parturient viverra montes placerat bibendum metus vel penatibus inceptos diam ultrices, litora hac sed etiam aenean vivamus libero facilisis per mollis risus.',
  ),
  Book(
    bookAuthorImgUrl:
        'https://www.clipartqueen.com/image-files/male-profile-silhouette.png',
    bookCoverImgUrl:
        'https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg',
    bookDescription:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit, ligula aliquam magnis lobortis euismod suscipit luctus, curae rhoncus nascetur malesuada condimentum potenti. Viverra felis aptent mi cum ante tristique ut dignissim, vivamus donec justo nibh posuere lacinia morbi at, fusce ornare massa primis ullamcorper neque tempus. Convallis dis nullam parturient viverra montes placerat bibendum metus vel penatibus inceptos diam ultrices, litora hac sed etiam aenean vivamus libero facilisis per mollis risus.',
  ),
  Book(
    bookAuthorImgUrl:
        'https://www.clipartqueen.com/image-files/male-profile-silhouette.png',
    bookCoverImgUrl:
        'https://i.pinimg.com/originals/a1/f8/87/a1f88733921c820db477d054fe96afbb.jpg',
    bookDescription:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit, ligula aliquam magnis lobortis euismod suscipit luctus, curae rhoncus nascetur malesuada condimentum potenti. Viverra felis aptent mi cum ante tristique ut dignissim, vivamus donec justo nibh posuere lacinia morbi at, fusce ornare massa primis ullamcorper neque tempus. Convallis dis nullam parturient viverra montes placerat bibendum metus vel penatibus inceptos diam ultrices, litora hac sed etiam aenean vivamus libero facilisis per mollis risus.',
  ),
];

/// Widget class example.
class BooksExample extends StatelessWidget {
  const BooksExample({
    required this.horizontalView,
    super.key,
  });

  final bool horizontalView;

  Size get heightSize => const Size.fromHeight(225);

  Size get widthSize => const Size.fromWidth(160);

  @override
  Widget build(BuildContext context) {
    /// List of all objects.
    return ListView.builder(
      /// Physics.
      physics: const BouncingScrollPhysics(),

      /// Scroll axis.
      scrollDirection: horizontalView ? Axis.horizontal : Axis.vertical,

      /// Number of items on the list.
      itemCount: books.length,

      /// None clip.
      clipBehavior: Clip.none,
      //Item constructor
      itemBuilder: (_, index) {
        /// For each object we return a widget with the data..
        return AnimatedBookWidget(
          /// Size perameter.
          size: horizontalView ? widthSize : heightSize,

          /// Padding parameter.
          padding: horizontalView
              ? const EdgeInsets.symmetric(horizontal: 5)
              : const EdgeInsets.symmetric(vertical: 5),

          /// Cover parameter.
          cover: ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(10)),
            child: Image.network(
              books[index].bookCoverImgUrl,
              fit: BoxFit.cover,
            ),
          ),

          /// Content parameter.
          content: ColoredBox(
            color: const Color(0xFFF1F1F1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFF01DFD7),
                    child: Image.network(
                      books[index].bookAuthorImgUrl,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 160,
                    child: RichText(
                      overflow: TextOverflow.fade,
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                        text: books[index].bookDescription,
                      ),
                    ),
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
