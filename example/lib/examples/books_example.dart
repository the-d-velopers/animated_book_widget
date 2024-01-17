import 'package:animated_book_list/animated_book_list.dart';
import 'package:flutter/material.dart';

///Creating a class object
class Book {
  String bookCoverImgUrl;
  String bookAuthorImgUrl;
  String bookDescription;

  Book(
      {required this.bookAuthorImgUrl,
      required this.bookCoverImgUrl,
      required this.bookDescription});
}

///Simulates a background query with response a List of objects
List<Book> books = [
  Book(
      bookAuthorImgUrl:
          'https://www.pngkit.com/png/full/64-644639_male-head-silhouette-png-vector-black-and-white.png',
      bookCoverImgUrl:
          'https://content.wepik.com/statics/90897927/preview-page0.jpg',
      bookDescription:
          'Lorem ipsum dolor sit amet consectetur adipiscing elit, ligula aliquam magnis lobortis euismod suscipit luctus, curae rhoncus nascetur malesuada condimentum potenti. Viverra felis aptent mi cum ante tristique ut dignissim, vivamus donec justo nibh posuere lacinia morbi at, fusce ornare massa primis ullamcorper neque tempus. Convallis dis nullam parturient viverra montes placerat bibendum metus vel penatibus inceptos diam ultrices, litora hac sed etiam aenean vivamus libero facilisis per mollis risus.'),
  Book(
      bookAuthorImgUrl:
          'https://www.pngkit.com/png/full/64-644639_male-head-silhouette-png-vector-black-and-white.png',
      bookCoverImgUrl:
          'https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg',
      bookDescription:
          'Lorem ipsum dolor sit amet consectetur adipiscing elit, ligula aliquam magnis lobortis euismod suscipit luctus, curae rhoncus nascetur malesuada condimentum potenti. Viverra felis aptent mi cum ante tristique ut dignissim, vivamus donec justo nibh posuere lacinia morbi at, fusce ornare massa primis ullamcorper neque tempus. Convallis dis nullam parturient viverra montes placerat bibendum metus vel penatibus inceptos diam ultrices, litora hac sed etiam aenean vivamus libero facilisis per mollis risus.'),
  Book(
      bookAuthorImgUrl:
          'https://www.pngkit.com/png/full/64-644639_male-head-silhouette-png-vector-black-and-white.png',
      bookCoverImgUrl:
          'https://i.pinimg.com/originals/a1/f8/87/a1f88733921c820db477d054fe96afbb.jpg',
      bookDescription:
          'Lorem ipsum dolor sit amet consectetur adipiscing elit, ligula aliquam magnis lobortis euismod suscipit luctus, curae rhoncus nascetur malesuada condimentum potenti. Viverra felis aptent mi cum ante tristique ut dignissim, vivamus donec justo nibh posuere lacinia morbi at, fusce ornare massa primis ullamcorper neque tempus. Convallis dis nullam parturient viverra montes placerat bibendum metus vel penatibus inceptos diam ultrices, litora hac sed etiam aenean vivamus libero facilisis per mollis risus.'),
];

///Widget class example
class BooksExample extends StatelessWidget {
  BooksExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///List of all objects
    return AnimatedBookList.separated(
        itemBuilder: (_, index) {
          ///For each object we return a widget with the data.
          return AnimatedBookWidget(
            ///Cover parameter
            cover: Image.network(
              books[index].bookCoverImgUrl,
              fit: BoxFit.cover,
            ),

            ///Content parameter
            content: Container(
              color: Color(0xFFF1F1F1),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF01DFD7),
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
                            style: TextStyle(
                                color: Colors.black54,
                                fontStyle: FontStyle.italic),
                            text: books[index].bookDescription),
                      ),
                    )
                  ],
                ),
              ),
            ),

            ///Size perameter
            size: Size.fromWidth(160),
          );
        },

        ///Separator of list
        separatorBuilder: (context, index) => const SizedBox(width: 20),

        ///Number of items on the list
        itemCount: books.length);
  }
}
